<h3>Account Information</h3>

<table>
    <tr>
        <td>First name:</td>
        <td><input type="text" name="account.firstName"></td>
    </tr>
    <tr>
        <td>Last name:</td>
        <td><input type="text" name="account.lastName"></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><input type="text" size="40" name="account.email"></td>
    </tr>
    <tr>
        <td>Phone:</td>
        <td><input type="text" name="account.phone"></td>
    </tr>
    <tr>
        <td>Address 1:</td>
        <td><input type="text" size="40" name="account.address1"></td>
    </tr>
    <tr>
        <td>Address 2:</td>
        <td><input type="text" size="40" name="account.address2"></td>
    </tr>
    <tr>
        <td>City:</td>
        <td><input type="text" name="account.city"></td>
    </tr>
    <tr>
        <td>State:</td>
        <td><input type="text" size="4" name="account.state"></td>
    </tr>
    <tr>
        <td>Zip:</td>
        <td><input type="text" size="10" name="account.zip"></td>
    </tr>
    <tr>
        <td>Country:</td>
        <td><input type="text" size="15" name="account.country"></td>
    </tr>
</table>

<h3>Profile Information</h3>

<table>
    <tr>
        <td>Language Preference:</td>
        <td><select name="account.languagePreference" id="${sessionScope.languages}">
            <option value="english">english</option>
            <option value="chinese">chinese</option>
        </select>
        </td>
    </tr>
    <tr>
        <td>Favourite Category:</td>
        <td><select name="account.favouriteCategoryId" id="${sessionScope.categories}">
            <option value="BIRDS">BIRDS</option>
            <option value="CATS">CATS</option>
            <option value="DOGS">DOGS</option>
            <option value="FISH">FISH</option>
            <option value="REPTILES">REPTILES</option>
        </select>
        </td>
    </tr>
    <tr>
        <td>Enable MyList</td>
        <td><input type="checkbox" name="account.listOption"></td>
    </tr>
    <tr>
        <td>Enable MyBanner</td>
        <td><input type="checkbox" name="account.bannerOption"></td>
    </tr>

</table>
