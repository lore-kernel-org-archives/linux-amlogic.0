Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45E5CD342E
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2024 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xFeGuFga5SPIP9fE075emH27PW4dRRtgPdOu8cvV0Zo=; b=yH2Ay7ijwaGKDD
	qDwkUTFp8LTt5s/rV+o3PuXEKKBegl59Xl5oZBiP3ezVvMTM5RIOUQWmA3uOx6qBLbeppam02KE1i
	Q0FeAV6I1QN4k3Be7HQ4uZppjMqPAaQsp82QeL/WVxqlbjLOGcFP62hvPXZuiQ9lHCL3ygnc5f4m6
	SGAHWzrAeyup1VLG8LDYkMDyrzFXiZ0DXLSHj2Avra+S2KedwM2xPnnp5LeOc4K0b83jRGbcFc/3O
	imvqLRKYleGfN45XHbMnzTSz4o7qZ5HGZXD0Ul2Zpltt9yV8qLQj+9XmoGdVJ+AQK2pGHwZMJgLLK
	Q38Ap9QvWv1a6p558P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slNXW-0000000GZd1-1tTD;
	Tue, 03 Sep 2024 07:01:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slNWy-0000000GZTn-2UIV
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Sep 2024 07:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32A3BA414A2;
	Tue,  3 Sep 2024 07:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC8B5C4CEC8;
	Tue,  3 Sep 2024 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346847;
	bh=i8gz704Qm8ya/o5dE5ZS51DTR2abXR44TQSYVdI/Rvs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LKGBRKrII2OnJLG+xXOoZkNmjg6ze4cKMSaiXzuWwfs54t9MpoQNyiJY53hOM9vF1
	 P0BSAB5H3OB32JWIGGSIpDn9PJEpMw74aiw4LIOuBMiUJ27M8dqZxbpEPfhRu6YKEB
	 IACj7LUAIOA5eQzky+tR77KMruu1NmhfOjL/tRqqJBe9KE7vwBDQ25kqgO6FsS2cWv
	 guBMvZK+JNEklUnPYk1+ik8c524795jjmqPnRAFKXY4sBNPy7AQHztSpu3Wvha4j/b
	 v6QFVCoCAycvdqRDDIoFaY54zm9+2WU1MI4cAjAkiJv41w74D6fflQCt8I6cyRnUps
	 /rSW7lEVqtrow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D3ACD342F;
	Tue,  3 Sep 2024 07:00:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] support for amlogic rtc
Date: Tue, 03 Sep 2024 15:00:44 +0800
Message-Id: <20240903-rtc-v2-0-05da5755b8d9@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABy01mYC/1WMQQ6DIBBFr2JmXRpmaCrtyns0LgigTlKlAUNqD
 HeXuuvy/fz3dkg+sk/wbHaIPnPisFSgSwN2MsvoBbvKQJJuUpMScbUCqbVO44MMKqjPT/QDf8/
 Kq688cVpD3M5oxt/672cUUtyHViqNzpBWnZnfYWR7tWGGvpRyAFKqYPSYAAAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346845; l=1168;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=i8gz704Qm8ya/o5dE5ZS51DTR2abXR44TQSYVdI/Rvs=;
 b=PUa5Yy6NzJIV4PQ0E3FCZ1uWMcAzPrDAK3DadDyPFeWCAyJhZd0yCH21KZg7uBVsNtp/en4hi
 q5T0DfLtl5qCcRhzV271WF0t/jm/Ub6Xg8GeoRYlm6eW6yj2G/j74Y9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_000048_746943_D3DD75C6 
X-CRM114-Status: UNSURE (   9.49  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add rtc driver and bindigns for the amlogic A113L2 and A113X2 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Modify bindings clock name and perfect the example.
- Fix some bug in driver, and use dev_err_probe instead of dev_err in probe process.
- Use RTC API to handle calibration.
- Remove unused func and rename driver file name.
- Link to v1: https://lore.kernel.org/r/20240823-rtc-v1-0-6f70381da283@amlogic.com

---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 rtc
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../bindings/rtc/amlogic,amlogic-rtc.yaml          |  66 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic-a4.c                       | 481 +++++++++++++++++++++
 5 files changed, 568 insertions(+)
---
base-commit: 3047c9a740816d5a930c8c741c3932a3544267f2
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
