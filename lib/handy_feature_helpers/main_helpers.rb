require 'capybara'

module HandyFeatureHelpers
  module MainHelpers

    @@resource = ''
    @@resource_plural = ''

    def set_resource(x)
      @@resource = x
      @@resource_plural = plural(x)
    end

    def get_resource
      @@resource
    end

    def tab_link
      "##{@@resource_plural}-tab-link"
    end

    def form
      "#new-#{@@resource}"
    end

    def new_link
      "#new-#{@@resource}-link"
    end

    def submit
      "#submit-#{@@resource}-button"
    end

    def cancel_link
      "#cancel-#{@@resource}-link"
    end

    def modal
      '.modal'
    end

    def count_div
      ".#{@@resource_plural}-count"
    end

    def table
      "##{@@resource_plural}-index"
    end

    def table_rows
      "##{@@resource_plural}-index tr"
    end

    def edit_link
      '.edit-link'
    end

    def js_edit_link
      '.js-edit-link'
    end

    def show_link
      '.show-link'
    end

    def delete_link
      '.delete-link'
    end

    def close
      '.close'
    end

    def accept_alert
      page.driver.browser.switch_to.alert.accept unless Capybara.javascript_driver == :poltergeist
    end

    def size_of(selector)
      page.all(selector).size
    end

    def visible?(selector)
      find(selector).visible?
    end

    def invisible?(selector)
      !page.find(selector).visible?
    end

    def click(selector)
      find(selector).click
    end

    def click_text(text)
      find('a',:text => text).click
    end

    def click_option(resource)
      find("option[value='#{resource.id}']").click
    end

    def has_content?(text)
      expect(page).to have_content(text)
    end

    def has_no_content?(text)
      expect(page).to have_no_content(text)
    end

    def table_has_content?(text)
      within(table) { has_content?(text) }
    end

    def table_has_no_content?(text)
      within(table) { has_no_content?(text) }
    end

    def ensure_delete_is_working
      tr_count = size_of table_rows
      within(table) { click delete_link }
      accept_alert
      size_of(table_rows) == tr_count - 1
    end

    def ensure_cancel_creating_is_working
      click cancel_link

      invisible? form
      click new_link

      visible? submit
      invisible? new_link
    end

    def ensure_cancel_modal_is_working
      click cancel_link
      invisible? modal
    end

    def has_validations?
      click submit
      page.should have_content "can't be blank"
    end

    def count?(count)
      within(count_div) { has_content? count }
    end

    def current_path?(path)
      expect(current_path).to eq path
    end

    private

    def plural(text)
      a = []
      a = text.split('-')
      p = a.last.pluralize
      result = a[0..-2] << p
      result * '-'
    end
  end
end
