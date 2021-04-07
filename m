Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD57C433ED
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15248613C6
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 04:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15248613C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0LxwptwbAbzvmj+ZyczvMfaYBc/Rp7mWXRstmdF+3I=; b=DrAQdtpGEGPFKa3UUvwxoMMx7a
	nMh8FU3HRcBSnIsk3T3jDUXp2NmE5nQgGvu+WdJXSwdEtZ23P+PWfrCLL/dpmChGlkWxUlKtw3JG4
	CiBfjf+MXZXYCMqU5BfuUAxvLqVh01G9v6/3Y5kzuAEIrZBarjME6DP6G+v9vLdMzwvN6AMrzjK4/
	zD8Dl0ZL5Gz0ea2XVvG+CnU0EnjLEiq3MzfryZlUIFjedHXmB/r35Ye7yjzjSDJHTLZMB+HVb9kGD
	zJqVbZSy4sbQj0GSZLf68cYdDMkVFMeUfJ1Sd4P+EWOmmTx9X5+8hUWauOaeI6skQZRDVvMhDvqxA
	QosIjPYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTzma-0041DW-4v; Wed, 07 Apr 2021 04:27:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTzlj-00417k-Qa; Wed, 07 Apr 2021 04:26:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id j18so16363653wra.2;
 Tue, 06 Apr 2021 21:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/uxm+ddpxxmXnSDmYZVbCjsl1x5gAL/tQbugquJp2r8=;
 b=r4cKC4I/BAIowW7LmjU17k7Swy6+R3wroLgZK/Az1SSdVSjOB0NNm1UNey/goh3ia9
 WUHXq/qqKP/75X2+jpeVeZG0Or/XGCHy1SYyCtztn1F+ABdBhv743hGlYvhJoypNogGB
 Fy63zAyqK4fOZhcotcV1e4Ha9QVjeMJFv6ZCyufaZ2PLADbba7Tcc3YV+y280JMKIbuj
 V89cQMZhcMaGJVjdAguOpnhIQ9kRtfs6Whelg7zNy8nxMxHN7HLlgSeFcX5Qy7MOVwG1
 YrRUuWb9yTM11+upV4GMga89yxEuas1FWsS1UL7K+B43Dy0PgQ4AMYOIwQNy3UuR/IjV
 gbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/uxm+ddpxxmXnSDmYZVbCjsl1x5gAL/tQbugquJp2r8=;
 b=cF+p0rS8xfzWEEaKsTQgfPt6yJDvnKVqO+lJy2AC0b5r3xu7xyx+ZLfZHlYDfKWeP0
 ELdUq9lrC9Dil+87mkoaoWIJlY8WWe7mbj6Og5dKCd3Gcr+9rfP9lmlXf21DGW4CX/OH
 Ktk4rXCYE+9hfLR7/rDjr+AbWkRoqfKyKaiwU6pg7/ELjUfSscml+RChXV2fEv124JD8
 eqtk6yN20+AyvtbQvDHwi4UU0mL2uaXm960ogzd7I9LHU6Ol/2kDCM/QO28Juy+k2/ps
 EghGKNwkybNVYE4RjBCpLwkmsR1EVppNAxTGOXWW9mRirbDCSPlMIB0Z9RN1P85RrHio
 segg==
X-Gm-Message-State: AOAM5322+POLuUsgoW2EZLDpbKZl5OKcESV+crfhAE/OqEYejWshnKRL
 o/nxPKQvEiVD1et4HI/ysWM=
X-Google-Smtp-Source: ABdhPJyROB8SHgsGrI+AyRhKK5dX/qKgDBb8UBGM45a5NvzXKqtanaRc3iLb/RFry6gbomXPk/ApDw==
X-Received: by 2002:adf:c10a:: with SMTP id r10mr1895742wre.40.1617769573901; 
 Tue, 06 Apr 2021 21:26:13 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k3sm16487112wrc.67.2021.04.06.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 21:26:13 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: meson: misc ODROID-N2/N2+ changes
Date: Wed,  7 Apr 2021 04:26:06 +0000
Message-Id: <20210407042609.9736-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_052620_095713_97DD4D89 
X-CRM114-Status: UNSURE (   9.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series cleans-up and submits some minor patches used in HardKernel
Linux 5.10 and 5.11 images for the ODROID N2/N2+, and fixes a stray tab.

Changes since v1:

- Added reviewed-by's on patches 1/3
- Added my Signed-off-by to patches 2/3
- Added missing vref to patch 2
- Rebased on khilman/v5.13/dt64

Christian Hewitt (1):
  arm64: dts: meson: remove extra tab from ODROID N2/N2+ ext_mdio node

Hyeonki Hong (2):
  arm64: dts: meson: add saradc node to ODROID N2/N2+
  arm64: dts: meson: add GPIO line names to ODROID N2/N2+

 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
