pragma solidity ^0.4.18;

import './CommonTokenEvent.sol';
import './math/SafeMath.sol';


contract StagedTokenEvent is CommonTokenEvent {

  using SafeMath for uint;

  struct Stage {
    uint period;
    uint discount;
  }

  uint public constant STAGES_PERCENT_RATE = 100;

  Stage[] public stages;

  function stagesCount() public constant returns(uint) {
    return stages.length;
  }

  function addStage(uint stagePeriod, uint discount) public onlyOwner {
    require(stagePeriod > 0);
    stages.push(Stage(stagePeriod, discount));
    period = period.add(stagePeriod);
  }

  function removeStage(uint8 number) public onlyOwner {
    require(number >= 0 && number < stages.length);

    Stage storage stage = stages[number];
    period = period.sub(stage.period);

    delete stages[number];

    for (uint i = number; i < stages.length - 1; i++) {
      stages[i] = stages[i+1];
    }

    stages.length--;
  }

  function changeStage(uint8 number, uint stagePeriod, uint discount) public onlyOwner {
    require(number >= 0 && number < stages.length);

    Stage storage stage = stages[number];

    period = period.sub(stage.period);

    stage.period = stagePeriod;
    stage.discount = discount;

    period = period.add(stagePeriod);
  }

  function insertStage(uint8 numberAfter, uint stagePeriod, uint discount) public onlyOwner {
    require(numberAfter < stages.length);


    period = period.add(stagePeriod);

    stages.length++;

    for (uint i = stages.length - 2; i > numberAfter; i--) {
      stages[i + 1] = stages[i];
    }

    stages[numberAfter + 1] = Stage(period, discount);
  }

  function clearStages() public onlyOwner {
    for (uint i = 0; i < stages.length; i++) {
      delete stages[i];
    }
    stages.length -= stages.length;
    period = 0;
  }

  function getDiscount() public constant returns(uint) {
    uint prevTimeLimit = start;
    for (uint i = 0; i < stages.length; i++) {
      Stage storage stage = stages[i];
      prevTimeLimit += stage.period * 1 days;
      if (now < prevTimeLimit)
        return stage.discount;
    }
    revert();
  }

}
