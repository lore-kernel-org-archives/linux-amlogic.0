Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF917EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eX3ln1yIytFFHPo8nqIL4Z9qaKYAEc+I6oupw0sYm00=; b=hsD1j+nzxLk8Iv
	9r2gaDIYsE7WHJSlDH78ckfo9A5OJTBPzJeU78Bnkj0W+P/4Tc6RecHb75jhSyfgqjFHLfMHuO++5
	LxpLpJseDRO2aAnQbP9gqCqDjdGUKFtFULA5RSxHXQhN+1wW4M7seLYkqpp/1/XEPTtG+x0nVtCQX
	wGNKFdcmpatp7SBcoQzgcvn+mQojADvKoLYU4NpMjfX4HcykXYbqLB0iNC2zU9UCNeHK++pDzYBAw
	rDlbPIUSntkIyQoEQOZSZhNpi6Atd3+y6czrspZkb3kutjM5Xjf+9IMptwR7W9mh8/nP/SYoG5SFp
	Nyys8NuHWJM4Pziao63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6t-000vfh-1x;
	Mon, 11 Sep 2023 15:45:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6p-000vd3-31
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:45:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so35852925e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694447152; x=1695051952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQpv/geSYQKf7XeeyrDQqaFj1lXBOylufuiB6Ca2YJ8=;
        b=MdiAJudPIg0Immje8W03qzPzAn2pkvuc1dJxgS608Y8evH0GggGsNkeMPN3P4B8UYi
         oTHhtH4PQXimB0ts2BOPtOsmIe8++8es7YrtkU6iwJPw5T4zAxZC4R0oZj1fVCjH030b
         f4vwxbpZsXhOIEBQfHFB0UAqv149ciPseGX+ZpEIMZrDRYQAHc406SMld5g2ucjbED5w
         KzAijJW/8VBNUNkzMO7CT4cy04YhUJNmCtFaf7vhKEAIsOicuJOjh0ecxmQo3KkFVEx/
         WSqABOvDA2Ba6YI/hTFvv8TeFSo2LUjxyxKk2v8jqdDRklNcL4qWmNAs5YG34qoBAW6D
         5DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447152; x=1695051952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQpv/geSYQKf7XeeyrDQqaFj1lXBOylufuiB6Ca2YJ8=;
        b=W05MWwjRM+EIuB1Yzhwx9pw17X3meYoQjTL/rPptwCfTTh0z/1P71++ZI0Yb3kEeP4
         iBKWc1cZJndVU+AmdygrpU/4tIxGqIERNt0GeK6a7+9GkV9kSs33yQtQod1tRQM5CKwQ
         idCuatyWlOE8pCluAr3rm97fU52BBJNpbQZOCBs66TurlJ8E7R8u8eWJEXTZOdsxcPZM
         vNwWNVcwzhzPLiE0TGMFXgG9PDWYez/wPcL0NTkmdheaRRl2eBEf0z4th/P41qKZAe0K
         mDU59tQeA5p8SOjp21DjSB+YKbcxd6kZgg2kcudGQTZo+uRcE3WtW4wO2nxpTEavpseB
         fqqQ==
X-Gm-Message-State: AOJu0YyETV2o7Mw/EC3g4OnFwsZ7dYY0TeiIQd4XCYxJ5rkUnpsO4jZw
	t+iL7orSy3kSo4tWp3cq7xrDqQ==
X-Google-Smtp-Source: AGHT+IGhd6VN30qru22xohgORcKjQlbzDL2sOujgcrLX5rl/SyWB1cmbpOW7R7S5HN8frK635LwDEw==
X-Received: by 2002:a5d:6585:0:b0:314:3369:df57 with SMTP id q5-20020a5d6585000000b003143369df57mr8967091wru.5.1694447152305;
        Mon, 11 Sep 2023 08:45:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.googlemail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13616255wmb.42.2023.09.11.08.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:45:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/5] arm64: dts: meson: u200 audio clean up
Date: Mon, 11 Sep 2023 17:45:36 +0200
Message-Id: <20230911154541.471484-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084555_974535_C8B0B7D3 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset fixes the recently merged audio support for u200 and adds the
missing onboard audio devices

Jerome Brunet (5):
  arm64: dts: meson: u200: fix spdif output pin
  arm64: dts: meson: u200: add missing audio clock controller
  arm64: dts: meson: u200: add spdifout b routes
  arm64: dts: meson: u200: use TDM C for HDMI
  arm64: dts: meson: u200: add onboard devices

 .../boot/dts/amlogic/meson-g12a-u200.dts      | 237 +++++++++++++++++-
 1 file changed, 226 insertions(+), 11 deletions(-)

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
