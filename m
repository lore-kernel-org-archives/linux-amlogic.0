Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB13FEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycOQBrQqskN4mAz73fzWBPvDS/TQDooA+7iwoWAdwGc=; b=O8weCnxTndKp9h
	VAvmYMID+8hHj9Rfo7fVWOuZFmy7jG4pEmtfVbLUgagpaXAZx+WyHRTMUGAJh9Zp7zedQHfMHagDJ
	Ur/q4Bq0slJJK9Y5l9stZNBDNjB8D1MHAvhN8fNTULfLS+Deuik1bpGNPlRXsJGgRphe99C6SZOZn
	Q9WeJ+uH/fcnumEFgFHQTFmzXNO/HohlCxgv85fxZxUgY+TNz01580HkDqdIht/Q5qaNOLepk0drD
	fmx5DM5IaBcCR2iLfoLMrPPALN46IrZHN1+0jRH72jARdZVBD4JyBenUT7/FiX6Oh+pyNM+ELA8pE
	yp4J3x1z5K+wdtRb/2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBqve-00DMKR-2J;
	Wed, 21 Jun 2023 06:02:54 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBqvb-00DMJW-2B
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 06:02:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9786fc23505so665607366b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 23:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687327369; x=1689919369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAEk81ZICVDtnc+wdWoBCpFc/VJWJ2dNtRwNJtzQAy8=;
        b=XiHH6lZdLXfcINNXyv9xpRvQR+NiN9dmTyUgmZ9J/P4nmSLifi+ZWb0O0CgM/9sQ4W
         a8eCK6gdjNGPqGDMeUVWvx8j++7TTFosFUmXpebaqEFKV10706tRCIZ/ONvgkVlnYJa5
         TS4mrZOQnGbyERQkCU5MM+AJMsz7ToARh7Gq1STPrYrKHKmujcJtI1eE5RASXsLI0vCs
         Tz2tvnCmRPZjnwqX7WW64WUwSSzFFiq9DW11fJ0V4ZoGLdhBkzvgqlnofq14xI5l8qyk
         FZ+u5MXAOETFVgBroBKqkOvIiv6layV72H7COcwB5k6fB8PhW12fk66ENKIQM7hIbYNs
         uHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687327369; x=1689919369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAEk81ZICVDtnc+wdWoBCpFc/VJWJ2dNtRwNJtzQAy8=;
        b=hQaGVoBswUr+UgYKTX27DGwbWF2gzuY+6qymr4vaHZAdn+zOiwcDZOKo28weBmcPL0
         v2/Rz92yNAd0Qwmky/0sy9U6VadruAipexp4kD09gqL4AyhhsxyQN99LADxc5p8pQveM
         w6TsiSFzNLb9I9OQtaTsyYPsoM5u88ZJqb2qjL32BHZArFUVsQ+UwJveQ1gVG8jzJjaR
         iBysS7preJRtTGn7qbjqbrK3w/EuaTZOzLHP6sXslnPUlVnYTmtCjJI0YPC4GMMPwS59
         DiCiL6DIEneTGjmH1SnnzgQV9YNVpgijNt87p1a8cy8aTPAlY3lknnCPeBvP0JbN0kqQ
         T0rg==
X-Gm-Message-State: AC+VfDzCnp8Z0ECUkoMq+Ky3Sj7/rUWaVTo3GjWhiGL5I1EXHXuTeap9
	Mt2nAJlz5ITpCPbLyhlM/4Mhng==
X-Google-Smtp-Source: ACHHUZ50b++2H7B0kJgKPXmL93Wl0xN8LfsMHkJef4xYJOLT4e6HR5bCEBNeFopNSOQDsDVkODhzxw==
X-Received: by 2002:a17:907:a412:b0:989:d9d:d911 with SMTP id sg18-20020a170907a41200b009890d9dd911mr4343002ejc.69.1687327369331;
        Tue, 20 Jun 2023 23:02:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906a00a00b00987bc81506dsm2482314ejy.202.2023.06.20.23.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 23:02:48 -0700 (PDT)
Message-ID: <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
Date: Wed, 21 Jun 2023 08:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-t7-a311d2-khadas-vim4: add
 initial device-tree
To: Yixun Lan <dlan@gentoo.org>, Lucas Tanure <tanure@linux.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230620134857.238941-1-tanure@linux.com>
 <20230620134857.238941-3-tanure@linux.com> <ZJIjtphyKdC48JrN@ofant>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZJIjtphyKdC48JrN@ofant>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_230251_806841_EFEF703A 
X-CRM114-Status: GOOD (  11.51  )
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

On 21/06/2023 00:09, Yixun Lan wrote:
>> +		apb4: bus@fe000000 {
>> +			compatible = "simple-bus";
>> +			reg = <0x0 0xfe000000 0x0 0x480000>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>> +
>> +			uart_A: serial@78000 {
>> +				compatible = "amlogic,meson-t7-uart",
>                                               ~~~~~~~~~~~~~~~~~
> if you introduce new compatible string, then at least you need to document it
> so Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml need to be updated
> 
> but my qeustion here, why bother introducing new compatible string if nothing
> changed with the compatible data? given the uart is same IP with g12a, can't we just
> use "amlogic,meson-g12-uart" for this? no only it will reduce the structure length of
> meson_uart_dt_match[], but also relieve maintainer's review burden?

https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L42

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
