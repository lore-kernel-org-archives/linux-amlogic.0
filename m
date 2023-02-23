Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F451C636D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Feb 2023 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S19cXXm4Olmcd7NmktJHgPE5upV1iWG13ngqd54EMM=; b=K6WoFW9Z7sjthU
	ObCng/dFIe9/4iqupTofmz0MkevHDCEpAfcwQCnU0qiKQIyNoFoTeki99XG09OqX7dPwGW10nN9Hp
	MLkNAri+1+4eyecI0r4qndpyFXj7pHWQ9bVkuqoLEu3hJCXJntx3G+Bnqoe1ryirNIkoteGWuKtEw
	1OZtT2UrwjmEfmyM1Eyt/78SFuGKo1YYof/cmnE5BsANvl4XCzrZTgLUYEow59HXxXyACrTlhlgea
	VmjDJi2+yYZFc81J26JJjNjrxaEtUp5bCTAWKyy/A8tFM5nwEONzkOxH4RgmeVz/NsTUkU3yJojXh
	cz+/YCB9W3dDFrFAO7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7en-00FeZ0-Ik; Thu, 23 Feb 2023 09:12:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7ed-00FeU6-2u
	for linux-amlogic@lists.infradead.org; Thu, 23 Feb 2023 09:12:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id h16so39874363edz.10
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Feb 2023 01:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u201wAnMMyK1J2VdH3tRl8blFsrXpgICjoZU678C2Y=;
        b=u0cbeBwWjvOlOpSDXCZWMGtsjZ4u3LMB4nqIBnsO5O3nVUU622A2v4GssCrLbLUmGX
         cwa+YVPOIy7fb1lJo7AHN7IrY43oETNcczP17W8Td07N8JGDmOZF7Wu+O0K+oHGaAaAM
         qiikM0fv67gQ63gWnQaB4GD1IVSnPcN/0R79ocx04Zx83Um+Sr8scn80eR1R2vuHCgem
         xtSubL1Y+tAuJ9YKEKDZLsmmMKIggVh3J2cNLtRTOvCwTpBSu14oFvyGRlpHYdPAouHH
         eehfTdI+WWZWDOfk6MEGRC+vdGppzy3nClFEsyOUi3mKi8282j+aEnkpjyMwms2sOdo1
         KsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8u201wAnMMyK1J2VdH3tRl8blFsrXpgICjoZU678C2Y=;
        b=JvGAZSD6IzVRKo4fbLlkApkTHLImRg5j6VtD9Q3ApnApvK3maed8QL2BHxh4Ib84Yy
         +lainknA5GBAKBezTZMYWsnEue6s8xIy1Ss23rYiSj+8et80mVWlAJLkxiFj+41k1jt3
         fTkAUb4jDhTnpdfvgv3lWOtlm7jvVGcbb9dIodUFyd5wARddfhmNxcMadLhTxrct1sx1
         3FkuhilMqRIOo7PKZYdRXjy8xIaFLPLSsrDq2XC3oAowqHaA7XXiRCfBrhlxJ6hnU+zB
         Ox4pQEBni2ZJ4nQroVyETmTR1LTpylwnsY8E3MySsaYCVGU0qmmzwAuC6vWpFOWF0c/m
         +NXA==
X-Gm-Message-State: AO0yUKUD81K0FI7NTUy+2vC7orj/7wRgQ7CUFM4N1kxA5yfI2y3YRuea
	42CBzaGrbjB6N7wOk9OYpNDCHQ==
X-Google-Smtp-Source: AK7set94Jx234h8hmP2Z8gvIEPkwRmtx1FRCZipRBCcVhWfTll6/KY1aCpd5T/pzyKnTLl4F19zgsg==
X-Received: by 2002:a17:906:e2ca:b0:8b2:5e3e:3103 with SMTP id gr10-20020a170906e2ca00b008b25e3e3103mr23521741ejb.49.1677143554675;
        Thu, 23 Feb 2023 01:12:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u20-20020a17090657d400b008b1779ba3c1sm8916528ejr.115.2023.02.23.01.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:12:32 -0800 (PST)
Message-ID: <319cb654-51f6-6241-802b-22ee0d5b0aab@linaro.org>
Date: Thu, 23 Feb 2023 10:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 RFC 1/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for G12A
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
 <20230222210425.626474-2-martin.blumenstingl@googlemail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222210425.626474-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_011243_167738_C2BBE4BF 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/02/2023 22:04, Martin Blumenstingl wrote:
> Amlogic G12A SoCs gained a new "divide XTAL by 2" bit. Everything else
> (we know about) is identical to the UART IP on GX (GXBB/GXL/GXM) SoCs.
> Add a new compatible string for this SoC so this new bit can be managed
> accordingly.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Why am I sending this as RFC? The last change in this series means
> that the resulting .dtbs are not compatible with old kernels anymore.
> My understanding is that this is fine and only the opposite case (using
> old .dtbs on new kernels) has to be supported (which is still the case
> with this series). I'd like to get some confirmation for this.

The other way around is also nice to have, because DTS is used in other
projects. You fixed here Linux kernel, but what about all other
out-of-tree kernels, BSDs, firmwares and bootloaders? Did you fix them
as well?

The question is whether the devices can be made compatible thus keeping
DTS working on older kernel. This commit suggests they are. Your DTS
commit is written in different tone - something was broken and is being
fixed.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
