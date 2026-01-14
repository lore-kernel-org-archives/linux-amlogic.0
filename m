Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7A6D29FEB
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JJnAHp6F6djJJ6OYNQtD6rY5R8j4TwQkFvw3ZVd3c78=; b=ofM2rHzaGR1CXE
	KfcHrIkbXlEIkQ73pG2RxgPhf918uNz5fcS+Q6HmzbuFOBj0jMFsBbfQprvZeBqMSgIGLVN5MoZXh
	znifdlS0LcdIkJBZVqVLnj6qnkvz7m2B+QrIFrx/9TXg5EF45PFVHulRsa3SUnHMx3RTpNsTI+qjE
	T+8o3wFXOvaDdWMNkiPsU/c2NDyHIhzVZpluACrodlDYrcNNHPNLOX1+X2zUXONXS09CUn90dTIDc
	dQV4HTqqH1sCx8HWeUXiR4UfB+tCrjHZymYjmiC7i+tlexor5vmcVhi4unZplVS74Sp+aj9I6UvRV
	QBCvKEB2NkxbhrH6D+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLn-00000008qQb-3LqZ;
	Wed, 14 Jan 2026 10:43:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLl-00000008qOx-0FoO
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 10:43:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee0291921so10059695e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 02:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387419; x=1768992219; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BlRF7x3GPWhzaZswMOKLBWLPrgVCED+FleXataOYLuA=;
        b=nhHeJr1TDp5XFhI00oxk2KUlXjixN8Tn4b4CqzuF+R0VYEDjtzv4yGyHM3LDB22zdS
         AvM/0I98mQTr4ZioZW/y0hhLpuT5fQtXb82182r8LvAjZbht3jDZH1AWCLJiF65yxBIN
         jJTiGeiinkjStDCjZsdvV9red+TL32AkdIIOGn0mLtFuu3ElTFWZh+hiihsP5n+Wc33c
         9wu38NTh5MnJiNUObnR00kzizvf11NWQDtQW8J5enDD+HC14njPIZo7fQTx+ryycEuga
         KE9oNLCtIyiBvvst93sjmAe+OgL0dXJqSMxYi6dypgbo9Gcb7iaZp3K6XBNR7WdVPykj
         ExYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387419; x=1768992219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlRF7x3GPWhzaZswMOKLBWLPrgVCED+FleXataOYLuA=;
        b=YlzdVwN2XCxlf+kwxZW69jbPX7M2CV4YvzdUFA50QeltOROctuNwHb1yjPfgLVXFWM
         zdkBsJgmqIO3BcWm1ccMNNBysG5f3J+PrT8B/yS5xrXdtcUmVkosxPwsAo0qgdJ+NBEx
         Motr0UN7pc9h92glb9YyC1YoadoNNR7n2nB6KRNVsQ4l4kIyEAhDSM8I2+lMucD0a+j+
         ojAHCOHFALqypXNZ8l+Ofas+lMBQTMq81jxITEBj5ubac1NaObIP/3J5PTvCm7zO3+9I
         YRyInpWdHwuz3vah6I/gOrQQLKNlo9l2lPdYmfs6XlhmJnXOn+1L9tdSdxrdVlK924zI
         t60Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWetsO0gbGtSTMDFyx5R8tFwWlN1LpC+OutkC7nhNM+RBsy/abDZUoUSIc/bqEPLYnXdO67E5hJuC98EFM@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYLxpzZVzgvk4Omn8zb5uPeyuZO3pO+X2tny8r+oHGgDP1GQr
	XSJo4ZGOUu6k/4+5BQrH8ipu7fQ2gNXzld2fY9tI5KT3LBubs/oMAS5ciCQFwcvncg8=
X-Gm-Gg: AY/fxX6TVFKchvO9ANjHt/+i9Ehz6gbxEjro1DQpDQDczsuhg+qYCCGkL6PL6jEFAG5
	aELaTRrU03vFECIlG2iFZL3rvK64SB4OHAw6qGnYp6gHTuxt6f4e5inh2NjEfbBskJkWOPjKXyZ
	/WSRnMuyDceu7vme9meaTOwwDimEBNaBr8XsMT54hONDwSkleQl9GV5hxE1MuvxVeYoJk5PLpJy
	epJLrGuM2kW36//ahivPKQdTYKYo2vcoV36Gq4hrU2NSaLMfnXd2Zd0uub/vpvZviMR53hIJIi5
	/pEPmltXdRCVhX/jieF/81ot6ARuhKroexJdXGqb6h55I3O/cEV8wG0/hbCXzY7o6lJtfxz7wA/
	kGPdscM6xrzXy3tHlZdhgidHAbn8w7kK/aseDXLT1CBDF0ILcV2/EZomU8zO11qYfeTJV10Scnm
	KKV5SoKKQPdw==
X-Received: by 2002:a05:600c:548b:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47ee33948d1mr27636215e9.17.1768387419126;
        Wed, 14 Jan 2026 02:43:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee27cf06bsm18320395e9.4.2026.01.14.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:43:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Date: Wed, 14 Jan 2026 11:43:10 +0100
Message-Id: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD5zZ2kC/4XNzQ6CMAzA8VchO1uzFeTDk+9hPGyjgyXgyKaLh
 PDuDk7GxHj8t+mvCwvkLQV2zhbmKdpg3T1FfsiY7uW9I7BtaoYcSy5EDnIcXGc1hALGUYOxr+c
 EDcq2Vg1XlSKWTidPabGz11vq3oaH8/P+JYpt+geMAjgIqYTRkhuF5qLkPFjl6ajdyDYz4qdT/
 HAwORU1Up2MQKzLL2dd1zeDp/ubAwEAAA==
X-Change-ID: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1LKCtim2I2hT1s40Y3DrwuSpkWo5wr0ZX4RSBFzQkDY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3NSZJZtIWJKLF9AEgh31t4Xmgs/V4YDd+dFa
 0XSd+pUp52JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdzUgAKCRDm/A8cN/La
 hZUjD/9xs+WWSkkahEPEw76BOMvXlY+wH1U4EcYR3okK0755L+Ix+DqOmP7l1pX1kw7lrDkLYLr
 zlkegkq8eEyv8Ia7LSGlR8Jmjq2+I8+sk9IUh+WMD7oKDVI5mZ6U559ORfS2g3vYXD+XZ5LJ8TC
 8Vu2FjUtF4+ovYxpiVdV6lJeIEOz/DNyaOFWdIlrRXp08FFl6czFmI3VQRF2yuHzEvvnbpcuSbX
 OhAEAPGyOqQ2x1XY8Oe61l8FYFJ3GTCN8UceZ3E9ys80BxAkBr32oaIN5tKILq8rzfB/rBP6KDs
 q3veyF23F3TRXrbAulemw7esd8lYg4/BGxWbyFebwZmp2eDXtTeduyhdxXUqbI3Sw+lKcYzUdIC
 gJUycJGUR2C6QFXp95eEwwA9QofkLVDMndVln7fDsCjOzyPWbD96plwtPgE31wkOEn2n9uSduLl
 FBNr9JtKnBiupNTh95URNfFsv1p7ENTP8No/mh/MWl5jjp4LKars5iBwvLvNWiYJzvql6CfgzBe
 dYMrTSwXoGzyRLyjPYLkm9ZQ5FzZjrhS6z8rOCD9Jp6YDvffFfQu2wmMS3kJY/hlXuXdKcPBmzM
 kGMZxoHi9FVTlGigcC8u5ALdVdRbuiOip+qTDhzFmNeHYli0nmhcQhVsrPh27odzMSvJpcTnMKc
 aKieeb0045kRqnA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024341_120106_82D25866 
X-CRM114-Status: UNSURE (   9.52  )
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

The patchset aims to address the issue raised here [1] for MMC B.

While checking this issue, I've found that MMC A and C also appear to be
improperly described in this platform's DT. The 2nd change fixes that.

To be on the safe side, the MMC clock should also be assigned on the other
SoCs. More changes will follow once things are sorted out for s4.

[1]: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/

Changes in v3:
- Dropped useless assigned-clock-parents
- Link to v2: https://lore.kernel.org/r/20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com

Changes in v2:
- Collect Tested-by from Nick
- Fix some typos in the commit description
- Link to v1: https://lore.kernel.org/r/20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
