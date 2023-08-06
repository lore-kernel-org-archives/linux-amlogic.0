Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1261FC0015E
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Aug 2023 00:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bd6Pv3ghtnCH/S9OsEGuPBWxsQUuK60ZfuqltGDfnI=; b=A06gS7Nbg6UFsV
	1fbmaHAps3QVdbkUa4qqnPo3b11wAjp1G+3rAZGGUzdkBwFqfwsJSSFEva/tW3qdAHSNLtqBOk9mg
	8bhAp47Be3fLmtbG9NF2c08VC4jfTD4AKRgviu++0T127ctHjj0myJHGON1h0+vTTHG9tJ2QW9yYo
	X+GfG3lPcOO4ocUk03avmUFXU5bKqZTCvPf78CNC/Ln4Q8WynPUVz4FYtyt5bQ3DS4SI7r+adXLJO
	PtL90GJDMX8U9XX+nFCjbJ6KuWEl1jgBt5Ql/24KSWccjkfUiWikhFMFN+3O8BfohCGiSEmHIlUFK
	NvdT8FD8kH22FagcwJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSRGm-00Eg0Z-2k;
	Sun, 06 Aug 2023 00:05:16 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSRGk-00Efzf-23;
	Sun, 06 Aug 2023 00:05:15 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1bf08ca187cso2462570fac.3;
        Sat, 05 Aug 2023 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691280312; x=1691885112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UGO1VfGHV59sGcd/OlhM815rBhbcYsIBbQw+i+B46zk=;
        b=aW0ADirHmQDgbrxgIti/gd97ygIxQCtXCEtQBwZfBUOEThVaswhFvBtuEREUlzRnTK
         SZC6cBrERFCNTds83qBtu6th+nJ03EOCdpZLF8mfRPerVOj99KAnuILoX3sep6P2YAna
         3IK3AzNq75bCgJprvFRGaPOK4omvtnIPo4CrpuGKVcmvnwSX8NuFo5nNbBXTOBNxU/tm
         vl5p86LkSZkEDo51SdSrqQZ9MAeMIDEnMsyxuRNXPMrzEUHnsozDkBYydvtHCqRrf52U
         KG7Dx+nJ1v1J6WWkRxXdqb5M3KVW0Tqc0vmvfsKLw4/82wGM8uoyWCep43SXetEyvGzN
         Qsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691280312; x=1691885112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGO1VfGHV59sGcd/OlhM815rBhbcYsIBbQw+i+B46zk=;
        b=fnZZHQXnakqZqMLrjmk6PfQR+cOd3JMxXX0RQ9Cdbp/Xo9SSvp7FUMU1UZ43hUkXZ6
         /+zbsx7RBghGDTfTXZkU+cXRAf4zyN1ObdrWGN/2dhDnn5I/IPTsnWCc0MnNx9qzTxoC
         LZIOp8nHH2vrBlHph2ThI0yY9+zfcYMk3ZzpykSJlXa1DdbwiF+qVVCNI/5FlR+hoWGa
         rhLw0y6DGY57nJqwrz1UOVHMg4UQIrXhvMdAFsvStSrgoLpa2cDWQf2ZkVIoF+4q4BQY
         QdpTJNmkrkd43BleSqOf4tR2KcEWRHwBJTed+LbWAM53BN+gjmUo0J9zSn++zRK1prgL
         kPfg==
X-Gm-Message-State: AOJu0Yy9X69SHSrPthumSSzE42+LZyqiT0WU5HBGHNwGxEwvaSVhq/FT
	rFw0r5zI15e3KFYyJXrpCTo=
X-Google-Smtp-Source: AGHT+IFYBscoDRUKj+BsfMN/xQKOUlh7C1v/0IlLZDRRaERctoSYra5uRwT9I0LHxe2OLVgh3OKXkQ==
X-Received: by 2002:a05:6870:4393:b0:1bb:8867:f7ef with SMTP id r19-20020a056870439300b001bb8867f7efmr7210903oah.25.1691280311691;
        Sat, 05 Aug 2023 17:05:11 -0700 (PDT)
Received: from Dell-Inspiron-15 ([2601:18c:8380:74b0:e8e5:f40c:d741:8f07])
        by smtp.gmail.com with ESMTPSA id g22-20020ac870d6000000b004054b435f8csm1611704qtp.65.2023.08.05.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 17:05:10 -0700 (PDT)
Date: Sat, 5 Aug 2023 20:05:08 -0400
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
Message-ID: <ZM7jtD2rniWAexVZ@Dell-Inspiron-15>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-4-linux.amoon@gmail.com>
 <ZMrFb7H1ynwwBSCA@Dell-Inspiron-15>
 <45d25fd5-465f-347b-448b-ce171626f34e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d25fd5-465f-347b-448b-ce171626f34e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_170514_700770_504C62D7 
X-CRM114-Status: GOOD (  21.89  )
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

On Sat, Aug 05, 2023 at 11:30:21PM +0200, Krzysztof Kozlowski wrote:
> On 02/08/2023 23:06, Ben Wolsieffer wrote:
> > 
> > Hello,
> > 
> > This patch breaks USB support on the ODROID-C2. As soon as the
> > onboard_usb_hub module is loaded, all USB devices disconnect.
> > Blacklisting onboard_usb_hub makes USB work as expected.
> > 
> > I tried to reproduce the problem by manually toggling the reset line,
> > but the problem seems to be specific to this driver. When reset is
> > asserted manually, the devices disconnect, but they all enumerate again
> > as soon as reset is released.
> > 
> > Also, I have been unable to make USB work again (until the next reboot)
> > even after unloading onboard_usb_hub.
> 
> Wasn't this patch made exactly to fix USB support, not break it? I might
> be missing something but maybe this was not tested at all?
> 
> Best regards,
> Krzysztof
>

I have been using USB on the ODROID-C2 for several years without issues.
It looks to me that this patch was designed to make reset control for
the hub more elegant, rather than fix a specific issue. The same change
was applied to several devices, so it seems plausible that it was not
tested on all of them.

Thanks, Ben

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
