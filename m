Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE4C31E4B
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C9221721
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 11:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gx4ZNbME";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JX7JAnlp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C9221721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IgCXyWXlv08BwO9OSj0JouANiJb+5+GU9QCcMQUlOMo=; b=gx4ZNbMEhov7KR
	6GQg7/TLSlgX+0ihnscTMyIRktXyvMCIfesqurE4EnZkzliVkID1dbhgqrRFD4mfHJvtTLFh+GZyp
	YoCRphFAPZaghh1zPMfRGb/GJVKXYJDRQySV0h351hHn4XkpvV3YHFZLczUv/Nr1ns8G3qr7Htjpi
	4CHkixdOZPob4xwPj/Vt3w1xTFY6Zt5PhV0USrfH0xFcKyY8DE2hjx2nBSfw5vn992obyvsn+XQQm
	Vo7rkDKsOUDA/NUswX7aPUmEBzps0I/D2YM4eGn5eGiFVw0wS0fiqnZmHPEkBFJpFnBw+HfzfzQDQ
	8TAQX5It/1HIuRcvJXPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbO7w-0008Us-K5; Thu, 13 Jun 2019 11:42:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbO7s-0008TY-Sp
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 11:42:42 +0000
Received: by mail-wr1-x42d.google.com with SMTP id n9so20458623wru.0
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0ZsHoiBuMTfOtADEzvR2C+3smzJtpOELu9NU33cfes=;
 b=JX7JAnlpC/5ro2x6Z+UAAbgxEG6zPqcxepO1yDEMKgXmun2iUYPZZfOtSXWXCup0J2
 zQ5Xe7sW3kEQ+83pe2ATBIcTRs1j6rTohOJedQT7LPzqQVJqqWw4cqOIqPrUC+oAYMRk
 lRLwy91wlqN1FX84m0R+znr/UC86Lr5yuqkcyi3aApJz65ybTrTPXb09MIBe+bXscuAB
 +i1cKAAKpK0cdVBUcEeMUL7sAZ0AusGK2aTVK03bSsf1eKp3xeWyvOtSra0UCKR+22Uf
 Cg/Trn/YM21oupZfSfYVEdr7taJjnDZ1a1IJQ+bQ0wAaKtLMgSdqPzI8AVk+MWDmcIsV
 t6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0ZsHoiBuMTfOtADEzvR2C+3smzJtpOELu9NU33cfes=;
 b=FbSITD7tG/W0rMV5cNf8/mvnbCY/TU2fH0rK0UGJEvpaZ2tkMwL0NIJlbUvevoyzkI
 6l8fhIose2Dy97jR35v++WUsPqH8KnujecliYui1RMYLvzLZ11tJGPEo/bD0HEfPbQg8
 /QCBcuR6fvvqR/HxuWcc7Ak8AmwiuQlzUwK69/cVE6WFvOfE6KaoEgnUVeGPn1eHxkwm
 n62ZPXs15UNKIPASAmTEciF8CtNmaWl2pBU2AUT/jDbaQignU0iRvJfziIvxtaR5bX6w
 sW/9YAO27zzm+JWaxv+Y1ZaqsKTcCCtscx7LrNWPxFI2IzuCBh0DcJLoXEURn/mqtxRd
 PYqA==
X-Gm-Message-State: APjAAAX81/h+ddk0HbGWaysftZ0yHkYwoWfy7ckeB77sVAM4c821qpGo
 zoqCsVmqd8vW4djOUMIMN5e20Q==
X-Google-Smtp-Source: APXvYqxsB0lJVQCFeg50GG0zAhStyAzrsN1OVM00ronb52Gz/5ZCc1kOTBrm5qHA0vi5//v9WpyGEg==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr41557303wrv.354.1560426159084; 
 Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/4] ASoC: meson: axg-tdm: i2s format fixups
Date: Thu, 13 Jun 2019 13:42:29 +0200
Message-Id: <20190613114233.21130-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_044241_072980_8D68A8D1 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patchset fixes a few mistakes regarding the format on the i2s bus
on the Amlogic axg tdm drivers.

Jerome Brunet (4):
  ASoC: meson: axg-tdmin: right_j is not supported
  ASoC: meson: axg-tdmout: right_j is not supported
  ASoC: meson: axg-tdm: fix sample clock inversion
  ASoC: meson: axg-tdm: consistently use SND_SOC_DAIFMT defines

 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 sound/soc/meson/axg-tdm.h           | 2 +-
 sound/soc/meson/axg-tdmin.c         | 1 -
 sound/soc/meson/axg-tdmout.c        | 1 -
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
