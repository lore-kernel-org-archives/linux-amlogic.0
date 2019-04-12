Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B57EC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AF152084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqJdFZuQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mXUl9y90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AF152084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FxUVy9DM78+1+RnIR+4a67L6UQgiM9Pd97NqPYBTSG4=; b=AqJdFZuQjxSuA/
	1Dx+PupjuFGEoMA5Nv5RAO3rywO2ziI2DkrERuSndElmUBfst885Pms0GfNwQqwZw/1+I2Aa1Dx66
	thBXNXD1MbSJk6azd4FfrONOkw8jeWdr1cpZjSYzmmqD/NjbejycdJcQ+FdNf9BoQbAQh6jXf3TbX
	edprOL9Mkxyx1roAepbmRx6YFx/2iMh23y3HIlus08CHL3D4WZ+I0HJnFN8RUwwJ8qqdGAmGTdxz3
	sud5oJ30UImKBYGAmOVJY5pEBqU70FpoaDbN5lWCTiBB7QToA82IL5wk7zdJ+M4A3hL/OQ2lA84nC
	geC7TU6Eob8YPm7V0iQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEt0u-0007bK-8o; Fri, 12 Apr 2019 10:02:28 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt0r-0007Xr-JQ
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 10:02:26 +0000
Received: by mail-wr1-x443.google.com with SMTP id s15so11120662wra.12
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id;
 bh=PWA/6bc7S3X2RU/kU2dEd3MIRRUaBhXLv9YSg4/IqAw=;
 b=mXUl9y90Pwsu7J/lJWeKJtYPi9ea+6CUmDDpl/1zN3+lzc1NmqBhscDYd9KqpZbVbs
 BT84EixGkPo7CkjMqLigFjNbpv9IHJji8RsT4MUH8EIj3xDN5m7ecxHBlol1jhLzBwvp
 UWSK6NFygyrRQtgfIDirr3eUpVM4lZl4qJsrpjCAI5s7fx9sQaHmHr9UPuQRKlt/htLG
 xHGSAWAn4VTwrvHjzjs1o9ZaWi9IZHBmmHJDUirarqhMMw1FbzQF4YqvnRrAYxD00XkH
 zQiMc7UQrCM3UHQ89z8GboRRFoKrqfc9ZwdG8Tk+WYMHuJeXyDMtDXNxg+SXRwBJu2xA
 qlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=PWA/6bc7S3X2RU/kU2dEd3MIRRUaBhXLv9YSg4/IqAw=;
 b=RsjVLd23bJiIL+Y3C6tXgoieDg7PRYTdFiYgHibf+zyktSl1K7gNUcdULx1f1vpxb1
 t7GQ8XaiKbyXpoHhviwzhZvY9x0vAVAmZ6U6N/sVFWomcCSOpEhKW0izUM+RIg69PaWM
 c6w3L7OOq6QS8NgXl6qRBGp3h/9PpipIqShqF9bK/bG3erVabIjiiy0wvcDFUkOM37Jo
 okUTJASeI/j+PGHW5eKU7D6pWC+cAmlPMB78ri6wRKG2r0+fejl3oaT3uT3nKF9TCoRZ
 k5RqNO2pyu966T1Wlzss/5tWI291MYTouZsOhQMjugptXF6uR4IVHR0ZbOGYa5CVcMWj
 W/VA==
X-Gm-Message-State: APjAAAXiDMWbDV8bUQ1hXuP5MouV42m+HhGFzKC/7zHure8GBwTP2kZM
 YT70Vfx2FWVu49af+Ozf75MMeA==
X-Google-Smtp-Source: APXvYqzaF57fqkpnTt6y1DY4hx4laKgodR8kNw5bpKrHDrYAvH2tMFjrPpkA+tU6S87Bg5GUt5qVnQ==
X-Received: by 2002:adf:b6a3:: with SMTP id j35mr33344741wre.25.1555063343241; 
 Fri, 12 Apr 2019 03:02:23 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm5961031wmi.16.2019.04.12.03.02.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 03:02:22 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Add support of Temperature sensor Clock for G12 SoC
Date: Fri, 12 Apr 2019 12:02:19 +0200
Message-Id: <20190412100221.26740-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_030225_640668_88FA0ABB 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

This patch series add support of Clock for temperature sensor
on Amlogic G12a SoC.

Guillaume

cahnges sinve v2:
- rebase on good branch

changes since v1:
- fix .width value

Guillaume La Roque (2):
  dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
  clk: meson-g12a: Add Temperature Sensor clock

 drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 ++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
