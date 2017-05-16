json.partial! "subjects/subject", subject: @subject
json.array! @concepts, partial: '/concepts', as: :concept
