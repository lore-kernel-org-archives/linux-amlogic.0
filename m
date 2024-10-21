Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E287D3C53F
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2024 06:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6Z3wSS8MCOMZc1IbapPANLKQlTflapknhMEh8Horrk=; b=Rqbg6lgyxqHCNv
	PTGiJaem8wrOBBKi6mkRFqofpmUlvQMRNoUnYKPxOUqHGn5KBxvwsaZd2T6CNCbZxDEXkQlulYR2S
	dBkZhejJ/NejYDsYBuDmNHIM0PpzZfkeCLk41m0YJjOf2IvTeZmpk8SK3VpZhIaj93DbFI1/a7eMF
	B6OvWQsGXZuTSPBVjO5ktWwkS/7PWReVfs0qm3b9ICOEV5LX1ZDbqTtNGeECZG9lwE6lavBErSPF8
	Lr7a9we4y0DPAibZai157rL7zN1nil09winbWHoVOpdeCxuu1OQUtyZ2lGfNnPm02zBp8o1qpeUMH
	vdYCmnSF2+hcc4tzHqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2lx2-00000006CtJ-362q;
	Mon, 21 Oct 2024 06:31:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2lwz-00000006Csu-2KxS;
	Mon, 21 Oct 2024 06:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55D96A4172A;
	Mon, 21 Oct 2024 06:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EB7C4CEC3;
	Mon, 21 Oct 2024 06:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729492291;
	bh=WhSHnMsUMuuz6aBN+4q6e1xLL5CV8bctPFFrYJZFMVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eZukqSlv2DxN+4ie17Ri7yvctbzM61UVj2Kzwz+aRuqk8sIqQ4308kPxgDgDk8PT9
	 PNiNWniiAbvOqTKztxwrXzolsyKfw4OAAJu8Wt7bX/c9NDJkgiCV9l+vDwouD02uRH
	 3VHaiXZxboXKvZ4gHbSRoJ3aMEBinqtzKk2O/nQ9+ybAEILC8uom3Snxe2uh6QSkZB
	 jdvU2KB4ZzCp755RRVOf+bktFOshHobJbdxtYuW2Q02+x81IGOGatdGQCzdsrw5pf5
	 ykTFZ//xQ1E5/SRANTfVtRJ/uX95OqYkrbcQ6RWhyQxJE3FM0XZ5T6/714+dzwjbDY
	 RJGtHswEg86YA==
Message-ID: <8cb615cf-1b4e-49ba-91fc-6e1f5f57cd3c@kernel.org>
Date: Mon, 21 Oct 2024 08:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <1jiktpr40d.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <1jiktpr40d.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_233133_762436_8B6C0F67 
X-CRM114-Status: GOOD (  22.46  )
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

On 18/10/2024 14:26, Jerome Brunet wrote:
> On Fri 18 Oct 2024 at 12:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> On 18/10/2024 11:20, Jerome Brunet wrote:
>>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>>
>>>> Hi Jerome,
>>>>    Thanks for your reply.
>>>>
>>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>
>>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>>
>>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>>> a new dt-binding header file which document the detail pin names.
>>>>> the change does not do what is described here. At least the description
>>>>> needs updating.
>>>>>
>>>>
>>>> Will do.
>>>>
>>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>>> to be referenced in DT directly using the made up numbers that are
>>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>>
>>>>
>>>> Yes.
>>>>
>>>>> If that's case, it does not look very easy a read.
>>>>>
>>>>
>>>> It does happen. The pin definition does not fall under the category of
>>>> binding.
>>>>
>>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>>>
>>> So the expectation is that people will write something like:
>>>
>>>  reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>>>
>>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>>> being completly made up, with no link to anything HW/Datasheet
>>> whatsoever ?
>>>
>>> This is how things should be done now ?
>>
>> Why would you need to do this? Why it cannot be <&gpio 10
>> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>>
>> Bindings have absolutely nothing to do with it. You have GPIO 10, not
>> 42, right?
> 
> That's what being proposed here, as far as I can see.
> 
> GPIOX_10 (not GPIO 10) maps to 42. If this goes through, for DTs to be
> valid in any OS, all need to share the same definition. That looks like
> a binding to me.
> 
> On these SOC, gpios in each controller are organized in bank with
> different number of pins. So far, this was represented as single linear
> array and that was not a problem since the mapping was part of the binding.
> 
> Are you suggesting 2 params instead of one ? something like this maybe ?
> 
> reset-gpios = <&gpio BANK_X 10 GPIO_ACTIVE_LOW>;

No, I propose the same as you wrote:
<&gpio 10 GPIO_ACTIVE_LOW>

but I don't mind putting bank there.

> 
> This means this A4 controller will be software incompatible with the
> previous generation. It will need to handled differently eventhough the
> HW is exactly the same.
> 
> Note that some form of binding would still be required to define the
> banks which are referenced by arbitrary letter in doc, not numbers.

Usually banks are considered separate gpio controllers, so numbering
always start from 0 because phandle encodes the bank.

And this is exactly what Rob already asked in v1 review.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
