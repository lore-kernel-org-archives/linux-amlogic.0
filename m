Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E39BC3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 10:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FeV3qg0AUCgo2+eLFBy34+fcR+2jPv4S6HcjF/Fa+yg=; b=O3QkEEBafhYEmD
	z4LF80ZoGdg5DmCRTtTyYcxUNTEdeG72YoQeY0ySiHsxRgJFwijW4JZKmF7ojABMtesfeKpwOkYiY
	MFv3x/ck4oE0/Tq2LftvEfRHXoGVpXprZZb1SD08oyHlK+Yu4DU/eQ0tyAQOB8TGZ1c2nALtuFKmP
	xwtBkilqZ4pZr/2XTronm5tAiieyVEMDKcnLtni4aC/H7p1g3vprmZUJxBZw6wZfVsAK1iHrw96kL
	wg/diIh3xIvrCxdcsGSIKLy0/zk4qbbA89GR7Robnzrxk7WEXe2YP1dxJdEiI/omEJPwnLn6wrAKx
	PLinvWj03WjEwHO5T6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUl7a-00000002QW2-1I5h;
	Fri, 19 Jul 2024 10:45:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5b-00000002Gbf-39A2
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:39:49 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42797289c8bso10798385e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721381986; x=1721986786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEbHlu47gMjntr/0lWZ1HMtnTqXHStCt809hwXsuo8g=;
        b=mWzzCUnysNHPTUu1leFyBEtPIprW4/pcVWNAPzPlbr8/dIgTiC8uOOpFMGFMRc5ciH
         +zIfkJJf0mCvite2qByDxoDVtj+/3zc3uCG9WLxsvryTT1F0+bCyAm0z4HHM+mwZxT1q
         Z+cCHPAPzD6FLf+aswxxIDcp8IaMJ8mTai5Iwk9kEUlb3lK66vmo0KLPoJW+26oc+GxL
         +CS3HLP+3t4vJcnhtJzOruWOCyytzc/wY88OKUZbypV7yfwTOXkl1QeFd/3QBJTSPW/B
         BvBx7l616ni6QjL/7WFnononGdvAkOAfYhfhTg8uG6UnTchWlHB3IDQWxBzBnIqhHvsj
         th/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381986; x=1721986786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEbHlu47gMjntr/0lWZ1HMtnTqXHStCt809hwXsuo8g=;
        b=Jj4x9KEbkfy+ZBlUzwuNNd/E4wr0GZdy8HilArCSWK1fgjhctAPgVZLGweuMfNI8oP
         2j7bUwXgAs72YDBynTunkLZa5DgouJS+oMw9v8b7WiEeif52TkU9sU10IuFSXTp4/nRM
         zraE86KgmKyJtPsZ3cbY/n1J/Cv98MR1DIGtDgYYSQOMRDVvhRzxzhZcDQ4JW5PNHzfR
         BIPU0iJ5Pk/ZQuPveo//MXfH8NEaqmMWMoEpX3ifC2ycXLxunPMYf7p2UXVijEQCWZxc
         uhlGYz2oH1mF0P4xPz7Xz6eFVdaHHYNAdEXfgAraULvNw6qFkWhr/h4hz2sGzq3nd2B7
         erlA==
X-Forwarded-Encrypted: i=1; AJvYcCUxdXODufI+UaCIxJwqsHpTINFIEQofgvZgAVMj5J4t/8+BQfiU4jsxIZ87u8nuUEnsrcrG5PVLMX2YdrLG0DYqDLqIf26PHr6IWMPsxoGV9aE=
X-Gm-Message-State: AOJu0YzrqIjDAl7inn73jvupwjXr4VQoHWA90LUjUEisWPUjk+Qrxb6m
	C9plP+MvJDlC/kvnr7E6/6DsbH7SWibWJQXQPVVkF3kmo6RGqzPdOJJiVdJDp2w=
X-Google-Smtp-Source: AGHT+IH4BxZr7nNiWWbM+lEJPkijyLd0iYBXu9qVNkbqOH0Fb5f61iPqIYleOo5sy/iDP8q/46Z88A==
X-Received: by 2002:adf:a112:0:b0:368:71e9:4ee3 with SMTP id ffacd0b85a97d-36871e94f3dmr1106799f8f.18.1721381985670;
        Fri, 19 Jul 2024 02:39:45 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3687868bc91sm1100956f8f.45.2024.07.19.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/3] clk: meson: sm1: add earcrx clocks
Date: Fri, 19 Jul 2024 11:39:29 +0200
Message-ID: <20240719093934.3985139-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_023947_903800_ED28F068 
X-CRM114-Status: UNSURE (   6.37  )
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

This patchset adds the eARC-Rx clocks on sm1 SoCs.

This pushes the maximum register of the axg-audio controller up
again so a SoC parameter is inserted to handle that correctly.

Jerome Brunet (3):
  dt-bindings: clock: axg-audio: add earcrx clock ids
  clk: meson: axg-audio: setup regmap max_register based on the SoC
  clk: meson: axg-audio: add sm1 earcrx clocks

 drivers/clk/meson/axg-audio.c              | 38 ++++++++++++++++++++--
 drivers/clk/meson/axg-audio.h              |  2 ++
 include/dt-bindings/clock/axg-audio-clkc.h |  7 ++++
 3 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
