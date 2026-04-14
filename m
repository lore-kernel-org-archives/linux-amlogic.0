Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1285EF9D0CC
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2026 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDVrjFTYUEPwMrM8OPJDm3/d7vJ0cjzII+3i7qr10RY=; b=l9Cs5i2eI2I5l3
	KhSX/dq3m7sOLMLdMZTSyEzvbp6WZXyYO5WvtO8tgrtEfqm2/Z7JdHbt4/d5Hdg7nJL5TmWYvt0LL
	xtqbWcdVFIKARGXbYFKsB4bKnvNiGXVl55ojFIgDRCHXES/PiKv0AmPxTqKouFME5rcgYSVQq6H55
	6+5fg9EG5vIn9KrS+H/f+WpqgEhm6Hlnxf3fYCeU4oSFnAVqBe4Y8nCT/1JwuEMBQyA8sN2rtLKHh
	DZ18UtMm7vjAlCNiTnW3SZu74OIpiQhUKPCIu+vDfKfLz9x21GyAN/RtnAy/fxski719fx0rIAqSh
	StMHm2IApPoEForw9SOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcxY-0000000HIhh-0eAR;
	Tue, 14 Apr 2026 12:33:40 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCcxV-0000000HIhF-2HZp;
	Tue, 14 Apr 2026 12:33:39 +0000
Message-ID: <69196110-0eff-4442-ab31-21e8e84781d8@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776170008;
	bh=d3bktvVna1J5QQvrEvpiMs7fPfSFe03MCbAM/nAAbGc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=kz77AKNlRM42Ei5wKqG+wr9GAcyb8/2iizonAQxHaYw7kfdWEgckgaS9Bs9bXooMs
	 nqT55MrItap3FQ65IYwKYIG9CdqS+D8KhXdVeSmEIhPPf/EGZw+ZHKeIUEolXuP1kx
	 9LQ8bDTniToDhR0NZNkX+ISN5llnL4/x0VDR82GQ=
Date: Tue, 14 Apr 2026 14:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 1/8] dt-bindings: thermal: amlogic: Add support for T7
To: Conor Dooley <conor@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260413-add-thermal-t7-vim4-v2-0-1002d90a0602@aliel.fr>
 <20260413-add-thermal-t7-vim4-v2-1-1002d90a0602@aliel.fr>
 <20260413-impose-cartel-bd7d18f91a24@spud>
Content-Language: en-US
In-Reply-To: <20260413-impose-cartel-bd7d18f91a24@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_053338_098000_026C3DDF 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/13/26 5:42 PM, Conor Dooley wrote:
> On Mon, Apr 13, 2026 at 12:52:42PM +0200, Ronald Claveau wrote:
>> Add the amlogic,t7-thermal compatible for the Amlogic T7 thermal sensor.
>>
>> Unlike existing variants which use a phandle to the ao-secure syscon,
>> the T7 relies on a secure monitor interface described by a phandle and
>> a sensor index argument.
>>
>> The T7 integrates multiple thermal sensors, all accessed through the
>> same SMC call. The sensor index argument is required to identify which
>> sensor's calibration data the secure monitor should return, as a single
>> SM_THERMAL_CALIB_READ command serves all of them.
>>
>> Introduce the amlogic,secure-monitor property as a phandle-array and
>> make amlogic,ao-secure or amlogic,secure-monitor conditionally required
>> depending on the compatible.
>>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
>>  .../bindings/thermal/amlogic,thermal.yaml          | 42 ++++++++++++++++++++--
>>  1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> index 70b273271754b..1c096116b2dda 100644
>> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
>> @@ -21,7 +21,9 @@ properties:
>>                - amlogic,g12a-cpu-thermal
>>                - amlogic,g12a-ddr-thermal
>>            - const: amlogic,g12a-thermal
>> -      - const: amlogic,a1-cpu-thermal
>> +      - enum:
>> +          - amlogic,a1-cpu-thermal
>> +          - amlogic,t7-thermal
>>  
>>    reg:
>>      maxItems: 1
>> @@ -42,12 +44,39 @@ properties:
>>    '#thermal-sensor-cells':
>>      const: 0
>>  
>> +  amlogic,secure-monitor:
>> +    description: phandle to the secure monitor
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to the secure monitor
>> +          - description: sensor index to get specific calibration data
>> +
>>  required:
>>    - compatible
>>    - reg
>>    - interrupts
>>    - clocks
>> -  - amlogic,ao-secure
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,a1-cpu-thermal
>> +              - amlogic,g12a-thermal
>> +    then:
>> +      required:
>> +        - amlogic,ao-secure
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,t7-thermal
> 
> This can just be replaced by a else I think.
> 

Thank you for your feedback, I will replace this `if` condition by an
`else`.

>> +    then:
>> +      required:
>> +        - amlogic,secure-monitor
>>  
>>  unevaluatedProperties: false
>>  
>> @@ -62,4 +91,13 @@ examples:
>>          #thermal-sensor-cells = <0>;
>>          amlogic,ao-secure = <&sec_AO>;
>>      };
>> +  - |
>> +    a73_tsensor: temperature-sensor@20000 {
> 
> Can drop the label here, it has no users.
> 

Ok, I will remove this label.

> Otherwise, seems fine.
> 
> Cheers,
> Conor.
> 
> pw-bot: changes-requested
> 
>> +        compatible = "amlogic,t7-thermal";
>> +        reg = <0x0 0x20000 0x0 0x50>;
>> +        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&clkc_periphs CLKID_TS>;
>> +        #thermal-sensor-cells = <0>;
>> +        amlogic,secure-monitor = <&sm 1>;
>> +    };
>>  ...
>>
>> -- 
>> 2.49.0
>>


-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
