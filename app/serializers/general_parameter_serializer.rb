class GeneralParameterSerializer < ActiveModel::Serializer
	attributes :id, :round_type, :laboral_days, :payday, :integral_base, :auto_liquidation
end
