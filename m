Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A10CC433E8
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:46:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4003B22482
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAd7Tt0e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xm5JNULg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4003B22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LB42ZM2Aao6zzBgzuDfyV3vxUQ8511bwT4zKlcs8AmU=; b=eAd7Tt0e5D6WlxOUWya2qakVSt
	ywCu+3/V0NbVW2Lc44LjA3SBS2KTymno03/o03uQfdfID8KvFUnF1x2KPpi/au1N8quO/j9DfUi7H
	7QmJR5dn5/9ZGCe5ICQ5zdjFdx0SZoy4RZi8ZdS2BYa3ZS9MGXxeKOZzTjUdnylukBedJxTZBP0RM
	PEix7y0pztI4QXLG/npKp33i1j7QjwNeQUEGpKHhAkouqdvXBAcNIK9Wq8O5YHQiiJpxmqq7qEV89
	Ekn+nWvgdnCRLhINwepl8RQugS/vpAmpjOA8CyJKMoIFAFkFgPnHbGJEBOr1x210UNenHca5aWTDf
	QWbndHTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwzL1-00039I-Vu; Sun, 19 Jul 2020 02:46:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwzKt-000379-5E; Sun, 19 Jul 2020 02:45:57 +0000
Received: by mail-wm1-x341.google.com with SMTP id g75so19125041wme.5;
 Sat, 18 Jul 2020 19:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KYbiuW9akHYr4iGm+mhAKAzYf50rap2sHQ/b1EeZvQE=;
 b=Xm5JNULgk+HvV4lgvqpxTOveb26IsydL5sSDuPK0E1GVOb+NGB6SaTXc0TGUReH8jc
 7+m2kBC/t4nvRSWEp0wms+TbeI2UGSdKj3hDwHrZkKXoqfcLkQ4UJyWf8sRfMxi2lA3c
 6cQFq6qqy56dloeFcH57da/Uqg7U2pCv8t2aogBTCAqj4NW3euw06yLWzLNHSOMPG38w
 SOIPAcC/SNq2dAiVijmo2DOPH5qtB93CmHdVTIkLuyBQeBSwtaftisObpMQQ2O1n94fl
 vSR5A1TUYPp+OswW8zxeZaUJ2brIdvEV7IHtOImUAEC7CiUh4PRiEYfKsUhudbl7r/5Q
 DIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KYbiuW9akHYr4iGm+mhAKAzYf50rap2sHQ/b1EeZvQE=;
 b=nxoPmG5tQ0d/96iwyfRJhW9xeOxqiZwV5IGoTb41BcN5yg7dCn6SXSJfeJLDaslM4S
 6VW5+FAN4tHWBn45nE+Ulcqw5uEMx27V2mTaQ4w53/1kd7h7un63qhr1IKeK6eePigOT
 0bSgRWclw5hd4PrVrogMyifDdMkr8eKi98JCqe8jh0ku+HYn5GUEWB4HavqT8LQistYl
 qmLo6LRdNvR4NsxQ/bl8ErPWwYe2kHS9X0RryGxrTM0+Rzqxps+t4XEucmY8/Hzoj4UW
 LmW5AUqBIwUjaxl0zXXFkJ6zsiVe8K63nYUB4so/MdOT+aLhYXEfE59nS18lOiu2J0eK
 oSTQ==
X-Gm-Message-State: AOAM532dfL60fvKPj/TttC1YKbKCVISaq2DrARnvVNHXLGxs7vBsitCH
 FE+VXZlEEB3Z/C7FoepnO30=
X-Google-Smtp-Source: ABdhPJyQ5SsSC6XvJcXlOahk61Svf/sAlbNZHZmBPNv0Ob764zWHfiQXHNOoK5Z3xOmT5d/aq77zkQ==
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr15573644wmg.74.1595126752945; 
 Sat, 18 Jul 2020 19:45:52 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e5sm5176242wrc.37.2020.07.18.19.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:45:52 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: meson: add more G12/SM1 soundcards
Date: Sun, 19 Jul 2020 02:45:45 +0000
Message-Id: <20200719024548.8940-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_224556_985199_3E478570 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds basic support for LPCM audio over HDMI interfaces
to the Khadas VIM3L (reusing the same config as the VIM3) and the
HardKernel ODROID-C4 devices, and HDMI + S/PDIF on U200 reference
board (reusing the config from the X96-Max box), I'm sure support
can be extended to include other hardware but this gets the HDMI
port working as a minimum capability. I have tested with VIM3L/C4
devices and a no-name S905X2 box.

v2 changes - include u200

Christian Hewitt (3):
  arm64: dts: meson: add audio playback to odroid-c4
  arm64: dts: meson: add audio playback to khadas-vim3l
  arm64: dts: meson: add audio playback to u200

 .../boot/dts/amlogic/meson-g12a-u200.dts      | 131 ++++++++++++++++++
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  88 ++++++++++++
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  |  88 ++++++++++++
 3 files changed, 307 insertions(+)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
