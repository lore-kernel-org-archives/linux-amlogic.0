Return-Path: <SRS0=HvuL=B6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100BBC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 12:13:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E18207BB
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 12:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KqCrZU0r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kecqFKVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E18207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jt2oY4HiWanLyZeR19iu0SR5AxbzZPp26fPVu1WkyQQ=; b=KqCrZU0rVtQWjnNY4kl4utNFzh
	GnuBoV6FcE3sY1hA2hOZ/3UWLcLoI0qIwaoPPIQmgCePaCGZAX7VkSFe2rAo6S4SbcAac6srlK1Jm
	ykTNjxZ23jaNvPEaCD5m/L69O5JaUDEoKUCSfkzU69f2sMOAlxgx2UXbttpEWfZKJ2ZY96aVF/y5w
	Aq41ILb0KwNbbRtIz0KqxdUiO9G66TnSk9ANjtbs3Vpcvm+MvPexvDZPENeStn/kiRNtcWyRNoUGr
	mH9fiL99XmZVvhuIvIhxVrsxUuH2Hpl8SYov3sPjE1/KHhU1q+hTC/lfvkRAzfVVZGKHo0lOkbIBR
	fvVKJoig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8jRq-0003eO-8N; Thu, 20 Aug 2020 12:13:38 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8jRn-0003dV-7w; Thu, 20 Aug 2020 12:13:35 +0000
Received: by mail-pl1-x644.google.com with SMTP id f5so939306plr.9;
 Thu, 20 Aug 2020 05:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2doVaeqHMIq6t5euMsS8lD+HylC+Pn28RLN5whjYgmM=;
 b=kecqFKVD+AL538Wpa8QOeSpjP0b4QE3rnhDNMJeEa05G98KrWR0dQkqpldBVRM+zQl
 wFjYLLkU+ICC9rBbV7GCFLACH9i0Wg3TIYaacfhi4m2KD1bRID/MgEpsnU6N1gIgnL68
 y+NG+JGyCft7oTd0YfkRlDJSSasQ3KEIa/UaYCNfT6azmUIvZPPoMhtzriPhfYJNbPef
 YtKJ1HRFn9ijb2FE6L7hDS4vqRdKGFMCOd1iv39sUfa7DXD7S8VWKw7k5GoyypJRhic2
 nzvyJX/CqzX2VgUH76CQNaYBJpbDf+RGrIWoxt7MY/h+vRm/Q4NbFuR6vWYyfGjAxnRV
 OrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2doVaeqHMIq6t5euMsS8lD+HylC+Pn28RLN5whjYgmM=;
 b=Iqph0fJsePK4eRWjXkoC4oZ09un+iEHAdyoTIUvClg+aXbl5uiHV7SLfCgFS076yjV
 dA0XgS/FUNS/2bragsqUvDo52lVJp43/fWJhvsmP2d1Ysm4gFUZt4Vw8ieAy5Ur1S/hn
 9WHVBi4/nLHJSF5HU8tdeo0C8f771s2LevW8QX0Ab7wAH9ZJzyc+1uTS9FBx4pWSfQwq
 p2cO9z0BthyN+D/s+biWRC06EOULbm47PBKLM5vQoNpmVwZ+Z1WR6JzgKJl+5i4lzaKG
 iYbAr7Hd4m1030MReIjYALbQYCUXwGaloEJxTca3Mso3HlSYMfo5pKY6Wkk/wBGJKG/w
 4O8A==
X-Gm-Message-State: AOAM533QJO04XPqn6SWrx3O3jePvGWM9cC6gFIaoYHU+t+hCz/6XjHVh
 Uyui2TtWRcBkIGG8kRb1wmE=
X-Google-Smtp-Source: ABdhPJzgUWn6iNqf1YNd6Nz1hgdV1NAP4WZDvIpStKf8rWEuXtpr1RrAWUlFBOD7GEibXYQyKvZYkQ==
X-Received: by 2002:a17:90a:3b09:: with SMTP id
 d9mr2441229pjc.210.1597925611491; 
 Thu, 20 Aug 2020 05:13:31 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id p20sm1985937pjg.44.2020.08.20.05.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 05:13:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 0/2]Enable RTC on Odroid N2
Date: Thu, 20 Aug 2020 17:43:21 +0530
Message-Id: <20200820121323.564-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_081335_298022_3515B2A0 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Inorder for test suspend/resume feature on Odroid N2
we need to enable RTC module on this device.

Changes v3
Drop the patch disable on VRTC driver.
Drop the INT pinctrl for RTC - not required for I2C.
Add the alias for RTC nodes.

Changes v2
Fix the missing INT pinctrl for RTC.

Note: Now the rtcwake feature works occordingly,
But after resume I have observed a Kernel Opps
Hope some body able to repoduce this.

-Anand Moon

Anand Moon (2):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 2 files changed, 15 insertions(+)

-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
