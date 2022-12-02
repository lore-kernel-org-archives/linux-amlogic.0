Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C43C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cnE4+mVF3KoNNGNmMVAxj0fY/AfhDa6hsMXDpWigHo=; b=EgM+WIbiL5P/8L
	/c10v5hY4VD7AO5ZGvC5+osuaz/6eY6rl1UOxfKab/uqeMzrx6KBT//yyYI0vrpaNMfx4PFoG27y7
	k/vfJ6Ee739fm48RWyLZc+QZ/gUsv4LkZ91KQYhKZVXFH/UJxRw8nVXVBnK8DmtPj+lgF0hr/eya2
	uRwZkfhXRmo00mE65OycrVi8l19vu922Rfss6oNXpuxvja7RqKxyBiI028eeX/SZnuK8kVUD8KcRv
	miE/CR8OvLhX8MQx9jitxQJ57cypiMVNKxjOyIsKduHo4XZoy70gnj+4lXgYlRU9O/xE2RDcPt3R9
	z/57sXPQPnpiJvmsTllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13SW-00FdL1-QH; Fri, 02 Dec 2022 10:39:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13ST-00FdH1-Pl
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:39:55 +0000
Received: by mail-lf1-x132.google.com with SMTP id j4so6831966lfk.0
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zeYMO6S95PVeGTfoyxNR76aAZjf7Y1iGkIH6FUXQn8=;
        b=uOb+/2naG5q/UNM9i0EvhDyeO/YGQAwiXlkSiDeudE36XTB7KeIwvNxkwZcs/Vyiv+
         WbJRVLvve+y/HbRoeRWD3tuWxHtNlCHMyAR4P+pC3vNd50ZypWqHNs6D4oyj6M6f+qwq
         lazaOJngBtLmCd5ITR8xDgRIG6zscsVvFykW0kRJlqoQqZ1IXa0wyFo6T8lSS6w9qVlQ
         s9yHEawcr2lS6HuPqw2vGmg2wGUNv/XeOzD66EiXcbPnk/U0g/w+fJgiNwPNTS15igpT
         w4DpgiQeUDyLCZh/nE8qnWBtRBoQLBOWXX4ViL8lVRsWENlTikAv9oP00IlJ9EC3Qz/9
         R1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zeYMO6S95PVeGTfoyxNR76aAZjf7Y1iGkIH6FUXQn8=;
        b=WL38KyhaOvSrnfglctRTUCIJhtgUSVmYPRyeXNmBFZ5X4kPvrZplKc8uCLjBl2lyqg
         Jq29Gw0RShZzYJiHfPN9Xq26o3dvoMjRujpgA2dcsLIXErDVYcVMsmaF6voJqLISiZVu
         JSmmVMP2vyfuIEkL6gtcH+dlVGe7+1rIX3jvzlKfMkP5tZq/DtbSDOQI3F2W5inG8Wy0
         Njsm68NUL8glNOq2rE419DKJxlSFp+/15nJrGgFkSl7/hXB+k6iTRXKC4Gs+gs72PQvD
         9yTTSMCSsvxKIvnaCOWgj8VDXJImFB1ZSBJruwNLEan+tkYb0yQfUKlxuiZWIANDh3ho
         cN5Q==
X-Gm-Message-State: ANoB5pn5DU51xN8f9r2cgMkduB39I96D6YJyl9ZAL3SRehubzfrjuRtz
	j01QEDeiAvXnu+lZO/813aTSeg==
X-Google-Smtp-Source: AA0mqf4RLRwoE2W6vreNSnUadEWIj3OMyVQu8S8FIcdH1f3dKB0BMtIXD0h7hHk0eMYVnq1vc7D4eg==
X-Received: by 2002:a05:6512:3a87:b0:497:45e:4557 with SMTP id q7-20020a0565123a8700b00497045e4557mr19760801lfu.230.1669977590007;
        Fri, 02 Dec 2022 02:39:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p23-20020a2ea4d7000000b002799e629b09sm598381ljm.56.2022.12.02.02.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:39:48 -0800 (PST)
Message-ID: <640ad325-91c4-109a-5ccd-05ac653a29bb@linaro.org>
Date: Fri, 2 Dec 2022 11:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: meson: add A1 peripheral
 clock controller bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Rob Herring <robh@kernel.org>
Cc: martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jian.hu@amlogic.com, jbrunet@baylibre.com, mturquette@baylibre.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rockosov@gmail.com,
 kernel@sberdevices.ru, neil.armstrong@linaro.org, robh+dt@kernel.org,
 sboyd@kernel.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-4-ddrokosov@sberdevices.ru>
 <166995398331.2089708.18189499743713568568.robh@kernel.org>
 <20221202094940.elhjbz7tbgxesr52@CAB-WSD-L081021>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202094940.elhjbz7tbgxesr52@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_023953_920091_B4121476 
X-CRM114-Status: GOOD (  15.89  )
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

On 02/12/2022 10:49, Dmitry Rokosov wrote:
> On Thu, Dec 01, 2022 at 10:10:04PM -0600, Rob Herring wrote:
>>
>> On Fri, 02 Dec 2022 01:56:55 +0300, Dmitry Rokosov wrote:
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the documentation to support Amlogic A1 peripheral clock driver,
>>> and add A1 peripheral clock controller bindings.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>> ---
>>>  .../bindings/clock/amlogic,a1-clkc.yaml       | 65 ++++++++++++
>>>  include/dt-bindings/clock/a1-clkc.h           | 98 +++++++++++++++++++
>>>  2 files changed, 163 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> ./Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml: $id: relative path/filename doesn't match actual path or filename
>> 	expected: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
>> Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:18.48-30.11: Warning (unit_address_vs_reg): /example-0/periphs-clock-controller: node has a reg or ranges property, but no unit name
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dtb: periphs-clock-controller: reg: [[0, 2048], [0, 260]] is too long
>> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221201225703.6507-4-ddrokosov@sberdevices.ru
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> 
> That's totally right warnings and errors. All of them are fixed in the
> my "fixup" patch of Jian's original dt_binding schema:
> 
> https://lore.kernel.org/linux-amlogic/20221201225703.6507-11-ddrokosov@sberdevices.ru/

No, this patch must be fixed. It's not correct.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
