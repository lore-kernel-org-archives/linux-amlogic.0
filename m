Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C51FC369A8
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91WZIcWaPC7LErWchNgiIAQaIfAiF1+9U/aGmnMYvDY=; b=kPdhqMaknrPOGT
	YiURbvZm+mHs5zLFM8IdAVw3b6L05akwwaou+d5eWsKUSJA/GDxYguyAKJZ+hImLxqhiN9B32+qIc
	G6Kp3Ctt82CpR8hXeLf2GHMVfZWopRW79WWwz5M+Yt/7bEyHWxlbXccaVAm1cvhQKdwqxskQU8hvU
	1PDfwSwbkTcmaRJMxYNMldCjZXYIvQwtjf96GsraAUVy9iZ6sRvwOpWDHcJ5o5/tk0orpbJ4ZbmPL
	CB0WHIQTEMeT0DxZz0olfhkBIXoQMTtZC21+JSBciRf8Ck7Hft2CBpfnn4y9v281Pf6kXiZgfA4vD
	0fkos3te4Nr0B7i6yBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A0w-0000000D4rj-3SOH;
	Fri, 11 Apr 2025 08:45:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39tb-0000000D2wV-1w9D
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 08:37:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1046811f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360674; x=1744965474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH2ZPuzfR/sU9gtELQf1xx9ouW+DErODBwUT5LwG1mM=;
        b=BQWlgrFSgWRUBRGUslckluPHmvlJVh3JY5tyfIJbKv1/BK2T0YEWMRV67A7Fs4X3ab
         xrFkLQHz6sytNnTHT5e627Ej2z2nw1HzgGHuft+Ln80d9/G1Tz9faUe5xY1kJFBrdR4J
         tbIpTkffOt1Kf3y304aOMVIUhsH37wg/SzBzGQx8/tDh0IfsfgUTMmXJ1PBZbiX+Fm7E
         CF5Oz3PLOuBZ7I7oS2OqnnOqMpP5zVSah5tNvS7pPcUJe5Oyu3XZ641jJNuC5cqPFYQ8
         RjqefK5BO61lFAhtvVUvKYmtZlV+fUx9Xb/DVm2FNbLPkA+h9tFOj+2p78h/8+JDmtTW
         2oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360674; x=1744965474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH2ZPuzfR/sU9gtELQf1xx9ouW+DErODBwUT5LwG1mM=;
        b=mJqC+7oKMXPK5Kc1fbx4mFlkgR+WUyGs6cZ74zml4E9abtQ8n7z1xMcJOo88GX4nJ6
         G2fD1y0ru3XQguOMGDTxNDzxDE4KUCL8mvnEQ1u5vLWoJ1BvGNLErCocQmssdYr6UWeH
         h2Sh5iCjEXcB1YO4XhiaV1aQXKaR6LSgczZCpykq+UDOr4KiEejOaReawYdAcEfwv+zT
         yjKJfqF2ooVEHvj9+k9F1gLrq96YOJELMt3bdGiX+AABATQh/w6S5dkraJ+hnQDQB2zU
         RRngAKklX3FxvoEQ9NiDX/FvvzMSF5X+teNHqIU9RdReb9NrSK3+P5i2Cqd/CrqcLVZy
         ahkg==
X-Forwarded-Encrypted: i=1; AJvYcCVuHEyVUMLWFNeFG++UHjVEPmsr5F8+BYaef9RQxms/Aktwly1GcmQtQ8w/lmaEo6PvQUVaNKnUSqtncvbl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdlln+evbJDYbfiPNkcVkG+nY2g7jVQUW2jbUwNXyZzJTmQ6eH
	g8riafx8I9qyZ26sN9+Z6oq0nydlQ4x27hKtBlHIsPW/4tAfCjlkl5b87rVFoiA=
X-Gm-Gg: ASbGncufWMr8WXOtT09xXMTwwjfsqpjzM0i7TA+XtN46TYMqEysQ1ZMZBF9Y6R9Vq5U
	rrmDMUHJ3myEWuBoC8yF6cy+6msYzTr9nYwrxgSmK+jOPP5fbWgCrIgp4TDGDvTldNg3m4CE77B
	ny/Lc7rKuo7iqPM97oeEwZkQ+M/4546FNIgF5OxilYwgltc2bXseSdu8Eijd+nlNnOmy1MtjsHz
	XSX1Av8tmEO3ODvQcYuVgIUschFz+b+Ew7oA+/3yqWC1iSDx/X0DIgqMKZcWiFYl2qV3AqWsKnn
	o1PZzM37eVGz5vVSxRvnbz/FVGRxEMX0WAUyqC7bYZ1mAny5AYKwpekVFbSGaA==
X-Google-Smtp-Source: AGHT+IESQEmfqjjVD+jC6dd63FDfAGrpItTMGFb0BJ+4OP4VGIDucBWUqxZDD69YlSOe5qeibdfp9g==
X-Received: by 2002:a05:6000:2c5:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39ea51ecb8bmr1357243f8f.5.1744360673907;
        Fri, 11 Apr 2025 01:37:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9777a0sm1326282f8f.43.2025.04.11.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:37:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
Subject: Re: (subset) [PATCH v2 00/17] Arm cpu schema clean-ups
Message-Id: <174436067236.3436338.6767561918297500530.b4-ty@linaro.org>
Date: Fri, 11 Apr 2025 10:37:52 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_013755_509400_598032B4 
X-CRM114-Status: GOOD (  12.18  )
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

Hi,

On Thu, 10 Apr 2025 10:47:21 -0500, Rob Herring (Arm) wrote:
> The Arm cpu.yaml schema fails to restrict allowed properties in 'cpu'
> nodes. The result, not surprisely, is a number of additional properties
> and errors in .dts files. This series resolves those issues.
> 
> There's still more properties in arm32 DTS files which I have not
> documented. Mostly yet more supply names and "fsl,soc-operating-points".
> What's a few more warnings on the 10000s of warnings...
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[11/17] arm64: dts: amlogic: Drop redundant CPU "clock-latency"
        https://git.kernel.org/amlogic/c/4bc28af2da876531e5183d25ae807e608c816d18

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
