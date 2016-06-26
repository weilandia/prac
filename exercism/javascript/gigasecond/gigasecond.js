var Gigasecond = function(start_date) {
  this.date = () => {
    return new Date(start_date.getTime() + (Math.pow(10, 9) * 1000));
  };
}

module.exports = Gigasecond;
