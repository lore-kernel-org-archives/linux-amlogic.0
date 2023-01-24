Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E6AC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+yYVYi55v2H9lWSOcyqNAmndBl1XyHZ5kjamSjVAso=; b=kLlYKPM+98EA2d
	y/uaw8rHSf9pgmEdf/Bb+pMTA6rDcQX/7b2BJWvs7ROvCATEI2OBce4KZasmAoad4g57kYxTk9ias
	iJ7TmWJigOOQXVANLgeQFFYqTAjIIr5Ll6xzIF3SF2sh18cq5HQgS9sn6QhvPROuyNiVHbHbWa1jz
	YhhGvcOhXzjZtsfyg3LdZt+1ijsEs3bwSv3TCKTKoL1rVuXqKcRPsvpki67OBXFAAce7DTjASR+Ia
	GUbdR5hBBkkXMVoDpWyM54mjvHC8PbT1z6azckqq9iVSQuS3oXf6wmRtQnMLMJyRTlnSQJdrJdpT+
	y+enkPiz2XUp+vknUEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDgJ-002daN-K1; Tue, 24 Jan 2023 07:25:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDg7-002dWU-1r
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 07:25:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso590909wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tf2jkhDB/fcmN7gxB9BcFTlLK/uYEMsrGqgyWUEbIpY=;
        b=Ey5ePlReG/n9vBilW4cfQNWTL/l/rns4G9TU3NjLnRqHlJJzRriYkfBLv5xkOYvf6k
         tNxSvygXO6JmhBMATZP+4RWAM/qYoK+q58K2fGxlVf3UbxlZmZosyZyB7cVttv347tmV
         ToZmZNkSArgBvXSky7SGWU5otTh8k17jeKQ6Uh0BaB+2hypaWFk51+cw5M9c8zLR4S3R
         rbDfCUXeYIQrU4d9Pt7pOiZaZYPBWWhjidrvFXtsrwVzlgWlckyPuyElevm1lIgZxXFd
         Sh35CcPBTdxpyV6N59BG7Xin73RUoxjOaqsLKKctlriqnkR8ys0RBffv86iFWpPani9v
         EefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tf2jkhDB/fcmN7gxB9BcFTlLK/uYEMsrGqgyWUEbIpY=;
        b=r7jG2WjCPjR7Vs9z+OMocCkETFUaYQT8sEUHDXdhJvEFyCgZX4s93dh3aSFClInDKR
         DHWNPgLJJkcj0ihm81wjcEmafVousELkKo87i0g088u18PDrF4atAA4tGGT3Avik41xC
         8mtRnBo5FydVHv9TGUFdxroFRLWmMpLAdvCID0oI53PqS5u1qZ9dZtv8nc631X8B6Ld/
         vNzFazHiCsRKgnL3//gWIVEP7rb06mo8p88ElQ5tO608FTN/dD8myhFKSQdH+A1v1r1G
         ZD3FH09zR8gFZdW0u4WNdE9Ex8MZ/ceWtSPrjJj656/LAPnZOH60iO4ype9CbSh2FGV4
         fv2g==
X-Gm-Message-State: AFqh2kroRjiZHkRt12sa8dmKh0aq74LVnCNDCE2MpH7Z42OsIdOwif51
	dyejuNVW4WrbIWZsIeoiY6aRiw==
X-Google-Smtp-Source: AMrXdXvH5bGz6Fl5hSlEDfijg+poG9+NkFL619URN+WkIB9aNvhttf/yW+RHKBUEvSvYNh4NNDJZuw==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id hg6-20020a05600c538600b003cf98447b11mr27831353wmb.23.1674545108902;
        Mon, 23 Jan 2023 23:25:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o25-20020a1c7519000000b003daf6e3bc2fsm1216707wmc.1.2023.01.23.23.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:25:08 -0800 (PST)
Message-ID: <e0dd24e8-9d4b-ea23-d1de-190330c0e825@linaro.org>
Date: Tue, 24 Jan 2023 08:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 11/13] dt-bindings: serial: restrict possible child node
 names
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, - <devicetree@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Tomer Maimon <tmaimon77@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Peter Korsgaard <jacmet@sunsite.dk>, Chester Lin <clin@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Kevin Hilman
 <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Fugang Duan <fugang.duan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Le Ray
 <erwan.leray@foss.st.com>, Michal Simek <michal.simek@xilinx.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Jerome Brunet <jbrunet@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
 <20230123151302.368277-11-krzysztof.kozlowski@linaro.org>
 <167451486467.2795286.1299932821783618559.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167451486467.2795286.1299932821783618559.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_232511_125924_D9AC9FEB 
X-CRM114-Status: GOOD (  14.18  )
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

On 24/01/2023 00:05, Rob Herring wrote:
> 
> On Mon, 23 Jan 2023 16:13:00 +0100, Krzysztof Kozlowski wrote:
>> The re-usable serial.yaml schema matches every property with ".*"
>> pattern, thus any other schema referencing it will not report unknown
>> (unevaluated) properties.  This hides several wrong properties.  It is
>> a limitation of dtschema, thus provide a simple workaround: expect
>> children to be only of few names matching upstream usage (Bluetooth,
>> GNSS, GPS and MCU).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.example.dtb: serial@1,0: Unevaluated properties are not allowed ('intel,ixp4xx-eb-byte-access', 'intel,ixp4xx-eb-cycle-type', 'intel,ixp4xx-eb-t3', 'intel,ixp4xx-eb-write-enable' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/8250.yaml

Did I just forgot to test all the bindings (except the changed ones)? It
seems so, therefoer note to myself:

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions). :)

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
