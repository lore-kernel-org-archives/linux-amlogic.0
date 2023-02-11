Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F26BC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n11RhbxDMGb3dNLAxk0YTxrldgMEUyzEEj56jQ7KvTY=; b=Zjft3pXPO3dKWq
	pe8ciTWvVjU1yL8U5hgIIcfM9Gmj+QdDxZuCP6ph5lYcsjkLcDNgeLSxWs+yYYzCa0MBBbg3NkhVO
	ESOjllDgWM8qtYDgk2e4DbjNInH71lYH9HXpnYrvAuHWXQV6LLCsHVl+ZppndopWaVLFoOPTO/JaS
	lK8E/0ybPX9OwUBUiXU8OskoZ0/BCJfv7Kuf7bJXBFBAEA0PCv2cvRN2pOkvhM7JBzxsNbqx6jhLM
	Hpz64rYx9HOD8NJ54z6UWcqkQakuExyAayjYTyb9fTNFNTy2vZ3he5JRx5joaFRVnHuGBfLC4SdJf
	jbLZUHGVDDJ73nExwmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwBJ-00AHpY-Lb; Sat, 11 Feb 2023 20:09:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwB1-00AHgZ-Jz; Sat, 11 Feb 2023 20:08:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s11so573296edd.10;
        Sat, 11 Feb 2023 12:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl7Fip7qfenkA+vATjGMmHQ+RoCFOUMthhj1X9/haL4=;
        b=Xq9fSKYaofUSG3Rs3LVizGAxYaVyD6xzFiW58Jxqw8LSsVNoC1xf8LiFLANVbMTFq6
         FU6NbBkztx717hafbCwGLnYQxvMMosEvGNLJVL5C2Y9x4r02uBbP7Qt7xs/IpYr+IkSz
         MKH67ux9+SmiiLCbybhFR86nqJGJNCmcatcS+GK/pXaFifzPvslO4FsZrCAd32xXDsvb
         hCqKe90RLn/yfini10WzS6Pq5WewTk+Y7hJzFsmzTx7OdiLspms2m9gQaYYI/anIpcjg
         9cnl+Ffb6t/RWasGlaXNHP0pOtO91yMvTEc3nuHrY3kOaUvuILn1LH1CnhJ80ygYrUkR
         1Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vl7Fip7qfenkA+vATjGMmHQ+RoCFOUMthhj1X9/haL4=;
        b=nbWjp8hfP2JCt9gxg+6wMWL7QQwVBrCBsL0KWC+ZOjY6kb77eSW+YRXKZE+ouNh/gP
         +fZSfGRRqclr2nPhYCWjBr8mVT+FwJrhIFyC59tcx+P0vB4I2tD1BsYeKz9tB5zXxhFA
         XsIxoSjm+N2ZpN9DjsvvuyH1VU2q+/5/76qko8esXFPArV/s209boWDLeuZWD37XcjnL
         bIHT+Y6bSUZDWgQR9gzKaMnkWcz2QTjpae74V8GKYH0wVf3iNqWUcsEBnKNFctFmvryo
         645kUXtVGug1qEaIptRBF+YLnBzsvL26CXS5/VvAGJRsP3IOX6NpyMZAoBf3kk2T1Qac
         YMUg==
X-Gm-Message-State: AO0yUKU7OWepxHdVyWyvV4YrDHBB1VxgZRlgzF4Ys17feUTD17/NF40B
	SQi/OpRLQzaNsaGDfE6PvmfJxCG13LJRDer4mF0=
X-Google-Smtp-Source: AK7set9pdHfv5lT0LgHnjGKDGQxMVRx6KxGQ2hvJg2a0pjXrwtlZdQMXfqCUFkQAFD1/Jn4xPLTQ7cGC/Dlo+1dEt1w=
X-Received: by 2002:a50:9ecb:0:b0:49d:ec5d:28b4 with SMTP id
 a69-20020a509ecb000000b0049dec5d28b4mr4811038edf.6.1676146129273; Sat, 11 Feb
 2023 12:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20230210170721.1285914-1-christianshewitt@gmail.com> <20230210170721.1285914-4-christianshewitt@gmail.com>
In-Reply-To: <20230210170721.1285914-4-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:08:38 +0100
Message-ID: <CAFBinCB-AgJ6aOYns1SBL4P-VkCCnmrmRoPbQz2qUppghHzs3A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: meson: gxbb-kii-pro: add initial audio support
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Ferass El Hafidi <vitali64pmemail@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120851_742360_84AC3F85 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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

On Fri, Feb 10, 2023 at 6:07 PM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add initial support for HDMI and S/PDIF audio output.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
