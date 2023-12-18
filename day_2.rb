content = File.read('day_2.txt')

rules = {
  blue: 14,
  red: 12,
  green: 13
}
result = 0

content.split("\n").each do |line|
  segments = line.split(':').last.strip
  line_id = line.split(':').first.scan(/\d+/).first.to_i
  valid = {}

  rules.each do |color, max_count|
    segments.scan(/(\d+) #{color}/).each do |v|
      valid[color] = false if v.first.to_i > max_count
    end
  end
  result += line_id unless valid.keys.any?
end
p result
