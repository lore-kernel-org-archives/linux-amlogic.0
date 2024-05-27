Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F341EC25B74
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2024 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgMl/5GI93I4dMac7WG4bAwEDR5AynOrSWq4GRixGMc=; b=r97ll3hIEUR59j
	5+m7hL0TDQ6rU4VMCpJVWghcJlxMOCMDNA3b0BxpSOtyyXP11+lrKXa75CniF8NXHPdKQ0wesuUhr
	xv2Iq4H7Z/pG9N4sDGTbv9sN0kDWZj0SOAUcCHLBJtF5RnTtLNm13Niv6rzsmaSeJfylszQhOD8qq
	MyOkj2yaAE7rPl1efRUhb2t770n4+eK/5ruEn3Rw6Ws835bKvPbKgy1mFNAvXeMhBzHgAE/ALPIOt
	18DhrUY9kRBUO92u10+jg/4KFo8UM1Tx69BRWys3tApRUzbw6J6tp4L0c/Fr0nIYk7A0woHbzdujq
	zsNRUk806+AAxn8PCKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaez-0000000FAcI-3nmQ;
	Mon, 27 May 2024 13:45:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaex-0000000FAYb-17Dh
	for linux-amlogic@lists.infradead.org;
	Mon, 27 May 2024 13:45:08 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-35507e3a5deso1739351f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2024 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716817497; x=1717422297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOPePvII73dyzyHk15m4pOPTJxMdXeXMFiP5kpq9p44=;
        b=NBAa/gP2Gk3i6ChY3cwiEGuLQjIlpN9qVT/11B+w2sq3lOCdwzaJceis8jHwNhI5/w
         seBnYGyNP4V72iMqZ+1KS1joiht15rSU4p+B2AAeuKBb9klPRKa19GTWMfqmt/JcR/+U
         9dUlQ9ej14p3rYFRpfDD5ueP2kuNPmAveW/n/Wn4shERQ8IRh3MM/SO+1Xf5eJUKWng+
         YAkkcbUQszzpOwRApNmyjjoXFXMKiO73M/Ma/Km9tEOePJVGMMcvxx4Ni07YG6lGLT/E
         cW5BUF8dUprwF+LaWHErlALICVLlEB9RIwvDZBqxSwoO2EvKd4mexrrxRU/JJUwysKeE
         nqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817497; x=1717422297;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOPePvII73dyzyHk15m4pOPTJxMdXeXMFiP5kpq9p44=;
        b=WsEocrUR0C4hdALSWW34YX5/vJ91yMWkJoo0staLW4zdtBRsfFiz979JkQsy1JQRRG
         kg7CLa6NRjMSd/8HD+VyN2PIzfmY9cE3/36khon1OUEEhntDUaNrJLlAIbBHG7m+/c4x
         ut3BS6evB9qijLi87ODTcw7JKkwiPaX6xKQUPkSOmrRVg/rlfEgXjijZCB349pQGBMGQ
         sKeiNazuGcbII+XjnmGLgOnXtDdghJ1mFOp0aCUGGAwzxMEliO7QQw82uMALMjKaDDq7
         ZLj5KWaayGpXFus2Qd27z9SVySvztAEBKkhyyvfQCydCZuGGkwWiiJiHTKko3S9nk6jY
         UkqA==
X-Forwarded-Encrypted: i=1; AJvYcCWO69Z5NblGM/Yxl3KMgmgoDfFaNYYW+ZjpbCqTRmVexOw2Rb7wsjRoTsdRWvLyDBnmCI7/Wzu0rN1EVAImFzHeW4aR78yRjckn7lLU0mkImNU=
X-Gm-Message-State: AOJu0YybD18FUb3hpikm6X7UsNzCYcT9hwv8A33KaRXcSnkYOznQCRYb
	pbkbvuXjOrV/tH8hvLZIoFtxc4G5oDfxKc09J1Z2qVTKSzHyRQThKLIvovBEMTU=
X-Google-Smtp-Source: AGHT+IGwS0/nDa3ITAcmca/nsJyVuSykEMrLjJDamCmRirIOzO7crmASNfLCNT5BvQ9XhxFkMcLswA==
X-Received: by 2002:a5d:598a:0:b0:356:4cd7:d3ac with SMTP id ffacd0b85a97d-3564cd7d4eemr7776462f8f.12.1716817496449;
        Mon, 27 May 2024 06:44:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a091051sm9114549f8f.61.2024.05.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 06:44:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jbrunet@baylibre.com, mturquette@baylibre.com, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, glaroque@baylibre.com, 
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
 lukasz.luba@arm.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@salutedevices.com, rockosov@gmail.com, 
 linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240328192645.20914-1-ddrokosov@salutedevices.com>
References: <20240328192645.20914-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: amlogic: a1: introduce thermal
 setup
Message-Id: <171681749543.2905422.16742406814394221719.b4-ty@linaro.org>
Date: Mon, 27 May 2024 15:44:55 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_064507_326197_828A9EC1 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, 28 Mar 2024 22:26:34 +0300, Dmitry Rokosov wrote:
> This patch series introduces thermal sensor declaration to the Meson A1
> common dtsi file. It also sets up thermal zones for the AD402 reference
> board. It depends on the series with A1 thermal support at [1].
> 
> Changes v2 since v1 at [2]:
>     - provide Neil RvB for cooling-cells dts patch
>     - purge unnecessary 'amlogic,a1-thermal' fallback
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/3] arm64: dts: amlogic: a1: add cooling-cells for DVFS feature
      https://git.kernel.org/amlogic/c/947bde9069c8241afe401433a6eff276595bb073
[2/3] arm64: dts: amlogic: a1: introduce cpu temperature sensor
      https://git.kernel.org/amlogic/c/049d141161903e656d9475950bb976240802c01c
[3/3] arm64: dts: amlogic: ad402: setup thermal-zones
      https://git.kernel.org/amlogic/c/593ab951232be4779e77f5b1bee0bef4e6fc1022

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
