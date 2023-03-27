Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B484C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cyoMbeSIiHxqH8r8REHmKJaerMpzW+bBffTb50gYjw=; b=h1XCjJQViwN4d5vxEm2k17S0j1
	4HfR6yMRxka3FTmTn3Rt2Ux3fPWlhzoGHOdHFAYONef47L/yonTR7l8tArftwdTz7VPgKFxvKVsy8
	R/3nA9EjqsVlsR+UNhAn4PRhrnOaVEXfN0EfUcNimb5B/qFSArMD8LkBkyvA7Qz8gRAJZqph5OFB1
	0CiRcFlPB1ZdjrL7w38SMrh0CvE9MQcsSEKjrKj7IPiwUa/1e7FTka/TiyPb8SLSKgArSCQ1t/uuI
	Vv1mtlITRmCqOfjmqrNleiWKcQxyddYFQbJ5yW6NAf6QO1T8xaf5zBw/lreOuqa/tXvjE5vDtrODm
	OD4cbNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnKI-00BBcq-0w;
	Mon, 27 Mar 2023 13:55:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnKD-00BBaZ-3D
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 13:55:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id r11so8878663wrr.12
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679925349;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9pc99uwIQzjl9n1D0bXEH2WGeSt6mESdgE+0lhZDWFo=;
        b=o1H4g6PXxDd7WQ1XE15gbdkHOdw1Opv3CGX7K5pdr44WKxqEkFQOoRVdrWFtTw7wzV
         KsNFJ/YLmK7BHl3h/8ZrZ1R4PEDJlYneF4dJAfrI0BxRgvoT6+wWbkNS56dy8IQijv+O
         D7J5EJH/ZSU0scUw0SFgUEoPpihqTx2hXUonxrsvemktPLwwF6dORF6XbP2d1KbNsTPb
         7bpIWWWzwt8+hqT1jaohTOWPXvh51B9UAHx0+paibKUlA+6kwJTcKM99l95nwANnh4i2
         QR1n4KSazKjg1ZXnQJpI2iVySlYrxMbs86f9tuHtr76VGCjsz7PBu3Fkh6imMWR1Fd8i
         OOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679925349;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pc99uwIQzjl9n1D0bXEH2WGeSt6mESdgE+0lhZDWFo=;
        b=Vbx3UEQw2L+RWyAbJQSib/WNqORN2z1Hkte9CpB7aChQE6Ga9qIE4wf2rl/EzDMMH2
         6WM0eK714Z3CvD+ZbQTlgqUPE7KEXEmKRJnSJHk2gttxupyLn/6HpOIw9Wl+GyWN9JE8
         kCTAvX69tiaW5xYwZ+E1JxOdYF5A8B9Zo1tM19uuQiAZ/43FDcwRPJp+xWCBtvb3Fysj
         w1fGCnht/AAWXQPhLzK/3Y3uzwaHTNJMK2BlSepLbarltq1hZZnCdReNKPnIPDALYVFL
         Fw0WP5W/TjbVYaC63c6zxZkXdnS3BFNta6AjIWCtK2rsyCquotJvO9b5qAARfB/t2mru
         ztfw==
X-Gm-Message-State: AAQBX9eF6RuVrQMaQp2hz0RQ3UphHQsOKZS0piW3mvv9uRv80XZZT/2q
	tk7mjfgWSnql7YocOPZ1atUc5Q==
X-Google-Smtp-Source: AKy350bALDAORP5R5D5dV3jfbUXqv8xWVCw64igC3DBEjdomPNbFYGczsMKz4eo0EbdTXHlQeXe/2g==
X-Received: by 2002:a5d:604e:0:b0:2c7:851:c0bf with SMTP id j14-20020a5d604e000000b002c70851c0bfmr9522521wrt.0.1679925349098;
        Mon, 27 Mar 2023 06:55:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2? ([2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000181700b002c5694aef92sm25072772wrh.21.2023.03.27.06.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:55:48 -0700 (PDT)
Message-ID: <01bac126-d057-d189-ca19-37db31057e99@linaro.org>
Date: Mon, 27 Mar 2023 15:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-4-ddrokosov@sberdevices.ru>
 <1jmt3yo5r0.fsf@starbuckisacylon.baylibre.com>
 <20230327105115.ury3w4xpzhcpnqjg@CAB-WSD-L081021>
 <1jilemo1r9.fsf@starbuckisacylon.baylibre.com>
 <ae367a80-e617-42a6-f873-73a1ecfe7c0d@linaro.org>
 <20230327131927.k7uswfn6i3jqjrzv@CAB-WSD-L081021>
Organization: Linaro Developer Services
In-Reply-To: <20230327131927.k7uswfn6i3jqjrzv@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_065554_031161_BF707E3F 
X-CRM114-Status: GOOD (  23.66  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/03/2023 15:19, Dmitry Rokosov wrote:
> On Mon, Mar 27, 2023 at 02:03:25PM +0200, neil.armstrong@linaro.org wrote:
>> On 27/03/2023 13:39, Jerome Brunet wrote:
>>>
>>> On Mon 27 Mar 2023 at 13:51, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>>>
>>>> On Mon, Mar 27, 2023 at 11:51:21AM +0200, Jerome Brunet wrote:
>>>>>
>>>>> On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>>>>>
>>>>>> Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
>>>>>> clock drivers.
>>>>>> Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
>>>>>> bindings and include them to MAINTAINERS.
>>>>>>
>>>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>>>> ---
>>>>>>    .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
>>>>>>    .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
>>>>>>    MAINTAINERS                                   |   1 +
>>>>>>    include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
>>>>>>    .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
>>>>>>    5 files changed, 267 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>>>>>    create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>>>
>>>>> There is two drivers (and 2 independent patches). There should be 2
>>>>> bindings patches as well.
>>>>>
>>>>
>>>> Before, in previous versions I had two versions, but it wasn't bisectable
>>>> approach.
>>>
>>> You are confusing bisectable and Rob's robot. Splitting patches is more
>>> that likely to help bisect (and patches backport) - not the other way around.
>>>
>>>> a1-clkc schema depends on a1-pll-clkc headers and vice versa.
>>>> It means dt schemas checkers will show us failure if we split them into two
>>>> patchsets.
>>>
>>> Only because you are patches are not upstream yet ...
>>>
>>>> I know, that we can use raw digits instead of CLKID names, but IMO it doesn't
>>>> look like production schema and it requires one more patchset above the
>>>> series with proper CLKID definitons usage and proper header including.
>>>>
>>>> BTW, there is an example of Rob's test bot failure found in the previous
>>>> v10 patch series due to chicken or the egg problem.
>>>> https://lore.kernel.org/all/167769997208.7087.5344356236212731922.robh@kernel.org/
>>>>
>>>> Please advise what's the best practice to resolve that..
>>>
>>> Don't use the header in your example would solve the problem and
>>> still be correct DT wise.
>>>
>>> The examples are just examples, they are not required to actually
>>> matches a real HW, as far as I know.
>>
>> Exact, you can use fake lables instead of defined:
>>
>> <&clkc_pll CLKID_FCLK_DIV2>,
>>
>> =>
>> remove "#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>"
>>
>> <&clkc_pll_fclk_div2>,
>>
>> is perfectly ok and will permit have 2 separate patches.
>>
>> The dependency is only if you have a common yaml file for
>> both bindings files, but this is not the case here.
> 
> Simple removal of "#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>"
> header doesn't work, dt_binding_check make rule is failed:

I never wrote you to only remove the include, adding fake labels phandles was the logical next step.

Neil

> 
> Error: Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts:28.37-38 syntax error
> FATAL ERROR: Unable to parse input tree
> 
> It happens, because 'dt_binding_check' generates simple dts example and
> tries to compile it:
> 
> cat Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts
> ===
> 
> /dts-v1/;
> /plugin/; // silence any missing phandle references
> 
> 
> /{
>      compatible = "foo";
>      model = "foo";
>      #address-cells = <1>;
>      #size-cells = <1>;
> 
> 
> 
>      example-0 {
>          #address-cells = <1>;
>          #size-cells = <1>;
> 
>          
> 
>          apb {
>              #address-cells = <2>;
>              #size-cells = <2>;
>          
>              clock-controller@800 {
>                  compatible = "amlogic,a1-clkc";
>                  reg = <0 0x800 0 0x104>;
>                  #clock-cells = <1>;
>                  clocks = <&clkc_pll CLKID_FCLK_DIV2>,
>                           <&clkc_pll CLKID_FCLK_DIV3>,
>                           <&clkc_pll CLKID_FCLK_DIV5>,
>                           <&clkc_pll CLKID_FCLK_DIV7>,
>                           <&clkc_pll CLKID_HIFI_PLL>,
>                           <&xtal>;
>                  clock-names = "fclk_div2", "fclk_div3",
>                                "fclk_div5", "fclk_div7",
>                                "hifi_pll", "xtal";
>              };
>          };
> 
>      };
> };
> ===
> 
> As you can see, header is required.
> 
> But looks like, dt binding checker is happy with the fake references hack :)
> Below there is generated example dts:
> 
> cat Documentation/devicetree/bindings/clock/amlogic,a1-clkc.example.dts
> ===
> 
> /dts-v1/;
> /plugin/; // silence any missing phandle references
> 
> 
> /{
>      compatible = "foo";
>      model = "foo";
>      #address-cells = <1>;
>      #size-cells = <1>;
> 
> 
> 
>      example-0 {
>          #address-cells = <1>;
>          #size-cells = <1>;
> 
>          
> 
>          apb {
>              #address-cells = <2>;
>              #size-cells = <2>;
>          
>              clock-controller@800 {
>                  compatible = "amlogic,a1-clkc";
>                  reg = <0 0x800 0 0x104>;
>                  #clock-cells = <1>;
>                  clocks = <&clkc_pll_fclk_div2>,
>                           <&clkc_pll_fclk_div3>,
>                           <&clkc_pll_fclk_div5>,
>                           <&clkc_pll_fclk_div7>,
>                           <&clkc_pll_hifi_pll>,
>                           <&xtal>;
>                  clock-names = "fclk_div2", "fclk_div3",
>                                "fclk_div5", "fclk_div7",
>                                "hifi_pll", "xtal";
>              };
>          };
> 
>      };
> };
> ===
> 
> Yep, we are able to cheat dt checkers, but we don't help dt developers
> with such example.
> May be, it's better to prepare two patches in such hierarchy:
> 
> 1) A1 PLL clkc bindings with fake references without clkc headers
> 2) A1 clkc bindings with real CLKID bindings + A1 PLL clkc bindings fix
> with real CLKID A1 clkc bindings + header.
> 
> The such approach resolves DT checkers failures and split DT bindings
> into two patchsets.
> 
> [...]
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
