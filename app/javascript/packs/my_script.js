$("#add-text-field").on("click", () => {

    let index = $("#question-list").children().length;
    let time = new Date().getTime()

    let row = $(`<div class='row my-2' data-index='${time}'></div>`)

    let formItem = $("<div class='form-item border shadow p-3 rounded'></div>");

    let header = $(`<div class='header'>Text Field</div>`)

    let body = $("<div class='body'></div>")

    let inputType = $(`<input type="hidden" id="${setInputIdAs("input_type", index)}" name="${setInputNameAs("input_type", index)}" value="text_field" >`)

    let inputQuestion = $(`<input type="text" id="${setInputIdAs("question", index)}" name="${setInputNameAs("question", index)}" placeholder="Question" class="form-control mb-3" >`)

    let inputPlaceholder = $(`<input type="text" id="${setInputIdAs("placeholder", index)}" name="${setInputNameAs("placeholder", index)}" placeholder="Placeholder" class="form-control mb-3" >`)

    let checkboxRequired = $(`<input type="checkbox" class="form-check-input" id="${setInputIdAs("is_required", index)}" name="${setInputNameAs("is_required", index)}" value="1">`)

    let labelRequired = $(`<label class="form-check-label" for="${setInputIdAs("is_required", index)}"> Required</label>`)

    row.append(formItem);
    header.append(removeBtn(time));

    formItem.append(header);
    formItem.append(body);

    body.append(inputType);
    body.append(inputQuestion);
    body.append(inputPlaceholder);
    body.append($("<div class='form-check'></div>").append(checkboxRequired).append(labelRequired))


    $("#question-list").append(row);
})

$("#add-text-area-field").on("click", () => {
    let index = $("#question-list").children().length;
    let time = new Date().getTime()

    let row = $(`<div class='row my-2' data-index='${time}'></div>`)

    let formItem = $("<div class='form-item border shadow p-3 rounded'></div>");

    let header = $(`<div class='header'>Text Area Field</div>`)

    let body = $("<div class='body'></div>")

    let inputType = $(`<input type="hidden" id="${setInputIdAs("input_type", index)}" name="${setInputNameAs("input_type", index)}" value="text_area" >`)

    let inputQuestion = $(`<input type="text" id="${setInputIdAs("question", index)}" name="${setInputNameAs("question", index)}" placeholder="Question" class="form-control mb-3" >`)

    let inputPlaceholder = $(`<input type="text" id="${setInputIdAs("placeholder", index)}" name="${setInputNameAs("placeholder", index)}" placeholder="Placeholder" class="form-control mb-3" >`)

    let checkboxRequired = $(`<input type="checkbox" class="form-check-input" id="${setInputIdAs("is_required", index)}" name="${setInputNameAs("is_required", index)}">`)

    let labelRequired = $(`<label class="form-check-label" for="${setInputIdAs("is_required", index)}"> Required</label>`)

    row.append(formItem);
    header.append(removeBtn(time));

    formItem.append(header);
    formItem.append(body);

    body.append(inputType);
    body.append(inputQuestion);
    body.append(inputPlaceholder);
    body.append($("<div class='form-check'></div>").append(checkboxRequired).append(labelRequired))



    $("#question-list").append(row);
})

$("#add-single-option").on("click", () => {
    let index = $("#question-list").children().length;
    let time = new Date().getTime()

    let row = $(`<div class='row my-2' data-index='${time}'></div>`)

    let formItem = $("<div class='form-item border shadow p-3 rounded'></div>");

    let header = $(`<div class='header'>Single Option</div>`)

    let body = $("<div class='body'></div>")

    let inputType = $(`<input type="hidden" id="${setInputIdAs("input_type", index)}" name="${setInputNameAs("input_type", index)}" value="single_option" >`)

    let inputQuestion = $(`<input type="text" id="${setInputIdAs("question", index)}" name="${setInputNameAs("question", index)}" placeholder="Question" class="form-control mb-3" >`)

    let labelOption = $(`<label class=form-label">Option <span data-option="${time}" style="cursor:pointer;" id="remove-option" class="text-danger">remove option</span></label>`)

    let inputOptionText = $(`<input 
    type="text"
    class="form-control mb-3" 
    placeholder="Text"
    id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_text")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_text")}">`)

    let inputOptionValue = $(`<input 
    type="text"
    class="form-control mb-3"
    placeholder="Value"
    id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_value")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_value")}">`)

    let checkboxRequired = $(`<input type="checkbox" class="form-check-input" id="${setInputIdAs("is_required", index)}" name="${setInputNameAs("is_required", index)}" value="1">`)

    let labelRequired = $(`<label class="form-check-label" for="${setInputIdAs("is_required", index)}"> Required</label>`)

    let addOptionBtn = $(`<button type="button" class="btn btn-primary btn-sm" id="add-option" value="${index}">Add Option</button>`)

    let optionRow = $(`<div class="row" data-option="${time}"></div>`)
    optionRow.append(labelOption).append(inputOptionText).append(inputOptionValue)

    row.append(formItem);
    header.append(removeBtn(time));

    formItem.append(header);
    formItem.append(body);

    body.append(inputType);
    body.append(inputQuestion);
    body.append($(`<div id='option' data-question="${index}"></div>`).append(optionRow))
    body.append(addOptionBtn)
    body.append($("<div class='form-check'></div>").append(checkboxRequired).append(labelRequired))

    $("#question-list").append(row);
})

$("#add-multiple-option").on("click", () => {
    let index = $("#question-list").children().length;
    let time = new Date().getTime()

    let row = $(`<div class='row my-2' data-index='${time}'></div>`)

    let formItem = $("<div class='form-item border shadow p-3 rounded'></div>");

    let header = $(`<div class='header'>Multiple Option</div>`)

    let body = $("<div class='body'></div>")

    let inputType = $(`<input type="hidden" id="${setInputIdAs("input_type", index)}" name="${setInputNameAs("input_type", index)}" value="multiple_option" >`)

    let inputQuestion = $(`<input type="text" id="${setInputIdAs("question", index)}" name="${setInputNameAs("question", index)}" placeholder="Question" class="form-control mb-3" >`)

    let labelOption = $("<label class='form-label'>Option 1</label>")

    let inputOptionText = $(`<input 
    type="text"
    class="form-control mb-3"
    placeholder="Text"
    id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_text")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_text")}">`)

    let inputOptionValue = $(`<input 
    type="text"
    class="form-control mb-3"
    placeholder="Value"
    id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_value")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_value")}">`)

    let checkboxRequired = $(`<input type="checkbox" class="form-check-input" id="${setInputIdAs("is_required", index)}" name="${setInputNameAs("is_required", index)}" value="1">`)

    let labelRequired = $(`<label class="form-check-label" for="${setInputIdAs("is_required", index)}"> Required</label>`)

    let addOptionBtn = $(`<button type="button" class="btn btn-primary btn-sm" id="add-option" value="${index}">Add Option</button>`)

    let optionRow = $(`<div class="row"></div>`)
    optionRow.append(labelOption).append(inputOptionText).append(inputOptionValue)

    row.append(formItem);
    header.append(removeBtn(time));

    formItem.append(header);
    formItem.append(body);

    body.append(inputType);
    body.append(inputQuestion);
    body.append($(`<div id='option' data-question="${index}"></div>`).append(optionRow))
    body.append(addOptionBtn)
    body.append($("<div class='form-check'></div>").append(checkboxRequired).append(labelRequired))

    $("#question-list").append(row);
})

$("#add-rating").on("click", () => {
    let index = $("#question-list").children().length;
    let time = new Date().getTime()

    let row = $(`<div class='row my-2' data-index='${time}'></div>`)

    let formItem = $("<div class='form-item border shadow p-3 rounded'></div>");

    let header = $(`<div class='header'>Multiple Option</div>`)

    let body = $("<div class='body'></div>")

    let inputType = $(`<input type="hidden" id="${setInputIdAs("input_type", index)}" name="${setInputNameAs("input_type", index)}" value="rating" >`)

    let inputQuestion = $(`<input type="text" id="${setInputIdAs("question", index)}" name="${setInputNameAs("question", index)}" placeholder="Question" class="form-control mb-3" >`)

    let labelFrom = $("<label class='form-label'>From</label>")

    let inputFrom = $(`<select name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_value")}" id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_value")}">
                        <option value="0">0</option>
                        <option value="1">1</option>
                    </select>`)
    let inputTextFrom = $(`<input placeholder="Text From" type="text" name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_text")}" id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_value")}" />`)

    let labelTo = $("<label class='form-label'>To</label>")

    let inputTo = $(`<select name="${setOptionAttrName(setInputNameAs("options_attributes", index), 1, "option_value")}" id="${setOptionAttrId(setInputIdAs("options_attributes", index), 1, "option_value")}">
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>`)
    let inputTextTo = $(`<input placeholder="Text To" type="text" name="${setOptionAttrName(setInputNameAs("options_attributes", index), 1, "option_text")}" id="${setOptionAttrId(setInputIdAs("options_attributes", index), 1, "option_value")}" />`)

    let inputOptionValue = $(`<input 
    type="text"
    class="form-control mb-3" 
    id="${setOptionAttrId(setInputIdAs("options_attributes", index), 0, "option_value")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", index), 0, "option_value")}">`)

    let checkboxRequired = $(`<input type="checkbox" class="form-check-input" id="${setInputIdAs("is_required", index)}" name="${setInputNameAs("is_required", index)}" value="1">`)

    let labelRequired = $(`<label class="form-check-label" for="${setInputIdAs("is_required", index)}"> Required</label>`)

    row.append(formItem);
    header.append(removeBtn(time));

    formItem.append(header);
    formItem.append(body);

    body.append(inputType);
    body.append(inputQuestion);
    body.append(labelFrom);
    body.append(inputFrom);
    body.append(inputTextFrom);
    body.append(labelTo);
    body.append(inputTo);
    body.append(inputTextTo);
    body.append($("<div class='form-check'></div>").append(checkboxRequired).append(labelRequired))

    $("#question-list").append(row);
})

$("body").on("click", "#add-option", function() {
    let question = $(this).val()
    let time = new Date().getTime()

    let index_option = $(`#option[data-question='${question}'] .row`).length;
    let labelOption = $(`<label class='form-label'>Option <span data-option="${time}" style="cursor:pointer;" id="remove-option" class="text-danger">remove option</span></label>`)

    let inputOptionText = $(`<input 
    type="text"
    class="form-control mb-3" 
    placeholder="Text"
    id="${setOptionAttrId(setInputIdAs("options_attributes", question), index_option, "option_text")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", question), index_option, "option_text")}">`)

    let inputOptionValue = $(`<input 
    type="text"
    class="form-control mb-3"
    placeholder="Value"
    id="${setOptionAttrId(setInputIdAs("options_attributes", question), index_option, "option_value")}" 
    name="${setOptionAttrName(setInputNameAs("options_attributes", question), index_option, "option_value")}">`)

    let optionRow = $(`<div class="row" data-option="${time}"></div>`)
    optionRow.append(labelOption).append(inputOptionText).append(inputOptionValue)

    $(`#option[data-question='${question}']`).append(optionRow)
})

$("body").on("click", "#copy-link", function() {
    let link = $(this).data("link");

    navigator.clipboard.writeText(link);
    $(this).html("Copied")
})

$("body").on("click", "#remove-question", function() {
	let index = $(this).data("index")
	$(`.row[data-index='${index}']`).remove()
})

$("body").on("click", "#remove-option", function() {
	let option = $(this).data("option")
	$(`.row[data-option="${option}"]`).remove()
})

function removeBtn(index) {
	return $(`<span id="remove-question" class="text-danger ms-3" data-index="${index}" style="cursor: pointer;">remove</span>`)
}

function setInputIdAs(type, index) {
    return `form_questions_attributes_${index}_${type}`
}

function setInputNameAs(type, index) {
    return `form[questions_attributes][${index}][${type}]`
}

function setOptionAttrName(nameAttr, option_index, option_type) {
    return `${nameAttr}[${option_index}][${option_type}]`
}

function setOptionAttrId(idAttr, option_index, option_type) {
    return `${idAttr}_${option_index}_${option_type}`
}