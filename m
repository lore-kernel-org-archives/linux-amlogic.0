Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC663C98332
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2026 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClZUSNUqkiIBoLu9k4o2avjUsoDleQsWZDKNmlo9uKw=; b=Jz1iuW9fPumLC7
	fakoC2WwQ+sauJ/ICbTqj1lLRFhNbRVzn0TADel2C8nQHNHeh6q++x7UBbvJXOaYJUpI/6mZvrCUv
	TMXcFue9hFl45v0ciWNi/DQU6P48ZqgiFRoi089sqbqiDhndJQb2DpwkfoTvqI2zI0I9TSZLy4nj2
	JdaZ8hwHAQB1Ni7FoA54bRw1Sz2MJtw3O611iHPoPXjSjlzB6Q4fVgjv0ILauxwn9to2wFO+16azC
	CE4yov5nr+p2jpJdoSxSQipE8ydLEcD+BNEP2cSlXc2Ftzpa1ALQ5yBrTyfIWeCIrPgisr10EajSs
	I6ZpV1qo/Ah1CtVi1tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqaC-0000000GVVf-3rD9;
	Sun, 27 Sep 2026 15:14:28 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqa8-0000000GVV6-3GtH
	for linux-amlogic@lists.infradead.org;
	Sun, 27 Sep 2026 15:14:26 +0000
Message-ID: <c93092bb-e3f7-462f-aa8f-a09dbb2946e9@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1790522058;
	bh=hsCJIQkqYuxFzzbKYzyukNxXPC64YPMx0HDRYYGxtJA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=eMsUfNsi9SLtEDWRzSc6H2xwtcuEkvZM0fjvkGTmN3kyBg48Jq1TeTFreNDZioqbx
	 fUO3oePYrrKsJZlUfDnsoMK28FzwbUsl7R3BJG7f1/+N2nClkuk3RTFDpxqD7WDlPZ
	 gqKY+99yDBieJS6MuqfPndZ28xeSCHaB1QJllZN0=
Date: Sun, 27 Sep 2026 17:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
 <20260927143733.DA8151F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260927143733.DA8151F000FF@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081425_278014_43BEF1D8 
X-CRM114-Status: GOOD (  14.81  )
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

On 9/27/26 4:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: pwm-amlogic: missing minItems allows validation bypass
> --
> 
> commit 359e122eac15df570817ba590b91f8958522a038
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> dt-bindings: pwm: amlogic: Add core clock for S4 like
>     
> This commit adds a third system core clock to the Amlogic PWM controller 
> bindings for S4 and related devices. It updates the conditionals for the 
> S4 compatible string to require three clocks instead of two, and updates 
> the examples to match.
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> index c337d85da40f1..e9cd5f1fdf264 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> 
> [ ... ]
> 
>> @@ -143,9 +143,15 @@ allOf:
>>            items:
>>              - description: input clock of PWM channel A
>>              - description: input clock of PWM channel B
>> -        clock-names: false
>> +            - description: gate clock for the PWM controller
> 
> [Severity: Medium]
> Will dt-schema successfully enforce the minimum 3 items requirement intended 
> by the commit message?
> 
> Because the global `clocks` property definition has `minItems: 1` and JSON 
> Schema's `items` keyword only validates elements that are actually present, a 
> device tree node with `compatible = "amlogic,meson-s4-pwm"` and only 1 or 2 
> clocks will silently pass validation.
> 
> Does this block need an explicit `minItems: 3`?
> 

If I remove one clock, the validation fails

```
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dts
  DTC [C]
Documentation/devicetree/bindings/thermal/amlogic,thermal.example.dtb
  DTC [C] Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@1000 (amlogic,meson-s4-pwm): clock-names: ['channel-a', 'channel-b']
is too short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@1000 (amlogic,meson-s4-pwm): clocks: [[4294967295], [4294967295]] is
too short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@60000 (amlogic,t7-pwm): clock-names: ['channel-a', 'channel-b'] is
too short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
/home/*redacted*/linux/Documentation/devicetree/bindings/pwm/pwm-amlogic.example.dtb:
pwm@60000 (amlogic,t7-pwm): clocks: [[4294967295], [4294967295]] is too
short
	from schema $id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml
```

>> +        clock-names:
>> +          items:
>> +            - const: channel-a
>> +            - const: channel-b
>> +            - const: core
> 
> [Severity: Medium]
> Does this also require `minItems: 3`?
> 
> Supplying just "channel-a" and "channel-b" will still validate successfully 
> without a `minItems` constraint here.
> 
>>        required:
>>          - clocks
>> +        - clock-names
> 


-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
