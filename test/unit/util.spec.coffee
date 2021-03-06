#==============================================================================
# lib/util.js module
#==============================================================================
describe 'util', ->
  util = require '../../lib/util'

  #==============================================================================
  # util.browserFullNameToShort()
  #==============================================================================
  describe 'browserFullNameToShort', ->

    # helper function
    expecting = (name) ->
      expect util.browserFullNameToShort name

    it 'should parse Chrome', ->
      expecting('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.7 ' +
                '(KHTML, like Gecko) Chrome/16.0.912.63 Safari/535.7').
           toBe 'Chrome 16.0'

      expecting('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.15 ' +
                '(KHTML, like Gecko) Chrome/18.0.985.0 Safari/535.15').
           toBe 'Chrome 18.0'


    it 'should parse Firefox', ->
      expecting('Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:7.0.1) Gecko/20100101 ' +
                'Firefox/7.0.1').
           toBe 'Firefox 7.0'


    it 'should parse Opera', ->
      expecting('Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; en) Presto/2.9.168 ' +
                'Version/11.52').
           toBe 'Opera 11.52'


    it 'should parse Safari', ->
      expecting('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.52.7 ' +
                '(KHTML, like Gecko) Version/5.1.2 Safari/534.52.7').
           toBe 'Safari 5.1'


    it 'should parse IE9', ->
      expecting('Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; ' +
                '.NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center ' +
                'PC 6.0)').toBe 'IE 9.0'


  #==============================================================================
  # util.formatError()
  #==============================================================================
  describe 'formatError', ->
    format = util.formatError

    it 'should indent', ->
      expect(format 'Something', '\t').toBe '\tSomething'


    it 'should remove domain from files', ->
      expect(format 'file http://localhost:8080/usr/a.js and https://127.0.0.1:8080/home/b.js').
          toBe 'file /usr/a.js and /home/b.js'


    it 'should remove timestamps', ->
      expect(format 'file http://localhost:8080/usr/file.js?1325400290544 and ' +
                    'https://127.0.0.1:8080/home/file.js?1332400290889').
          toBe 'file /usr/file.js and /home/file.js'


    it 'should indent all lines', ->
      expect(format 'first\nsecond\nthird', '\t').toBe '\tfirst\n\tsecond\n\tthird'
