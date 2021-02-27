var
    sortByTimeAsc = function (lhs, rhs) {
        var results;

        results = lhs.hours() > rhs.hours() ? 1 : lhs.hours() < rhs.hours() ? -1 : 0;

        if (results === 0)
            results = lhs.minutes() > rhs.minutes() ? 1 : lhs.minutes() < rhs.minutes() ? -1 : 0;

        if (results === 0)
            results = lhs.seconds() > rhs.seconds() ? 1 : lhs.seconds() < rhs.seconds() ? -1 : 0;

        return results;
    },
    sortByTimeDesc = function (lhs, rhs) {
        var results;

        results = lhs.hours() < rhs.hours() ? 1 : lhs.hours() > rhs.hours() ? -1 : 0;

        if (results === 0)
            results = lhs.minutes() < rhs.minutes() ? 1 : lhs.minutes() > rhs.minutes() ? -1 : 0;

        if (results === 0)
            results = lhs.seconds() < rhs.seconds() ? 1 : lhs.seconds() > rhs.seconds() ? -1 : 0;

        return results;
    };

//Sort Only Time by Ascending Order 
momentDates.sort(sortByTimeAsc);
//Sort Only Time by Descending Order
momentDates.sort(sortByTimeDesc); 