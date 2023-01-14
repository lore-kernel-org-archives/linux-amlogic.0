Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB99C677F1
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Jan 2023 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WqVtgSleNB965RuTokuPfFJfujiuuA8UGg0xOOdXYbQ=; b=bpNY2jr0Dj1Ekg
	U/uktxW8hPZvCHBoarIgPts328lVPW174EPmDuyH/zr4OEubVOXULUYauYb1S+CpTgIiR0UNwHftY
	xQ9pTKqXesRj4uDXIFDZWPT9qE5919Q1FtuuyT5wLAIgLYtVu+CILvJlsMaaYPEWFDS950QnJTUug
	bCUyF3qpnuGPURPrKJ3sFtBMCfaGNWjes/xt01ibINHqkpUBMgL+A2d1oAYVEnF652gRjeydHJv/+
	2R8+gu2paRljMy51j/aJ8a4k1N3LW/O3WSu1YmWUVJmovY0Gyfd493FKQEn6MKEtT8Teda4enRvTU
	FViRPtWVEfX7CLqlp5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGq3c-006ddG-Ev; Sat, 14 Jan 2023 23:35:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGq3I-006dWr-Jk; Sat, 14 Jan 2023 23:35:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s5so36059766edc.12;
        Sat, 14 Jan 2023 15:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2dKhwGkggyvco2BWOxYe3ouShVm3nX1AbOxxt3Y1Mo=;
        b=K90X840mVfYzdiMX47qN4epJtBMijiyCyzx/cAJPTFr8C+vLUpDkkxfQrrLkUfZ4PJ
         QdOoZPUyifgx0v9ZEf2Twvjdpc+ZkhJQymE6fFtd8m0sQmy9LmO2Ld7KiMYvcpxcIjx6
         aWtLgiCYe29ntbw7TPTjaHkfdIDFgKnevtVzIE1J7Qj3JLgvRzDkj8+mCWAGe3q34hgL
         h8/xRvgBQHFvqITKkxESyi1MblscJBkCuzDPbKta8ws3vspCft8uYQTZVs/F/wMFQOSD
         FwrjlcQymBFoKjMpSvN1PCVNpD66dOoBN5YiHozc+gkm2s+VMRONmpcsOTzK+JJFJyL4
         Mc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2dKhwGkggyvco2BWOxYe3ouShVm3nX1AbOxxt3Y1Mo=;
        b=vCj61o2fMSbWlQ2qgHv0fkA2i53Sb6v65SxJTd+ED7S3GWT3lJmo9xzO8llhpcfy+E
         KUgu9YikM9J9oBIDPrwA3yUDduZLuM571GMwK2lnTENmokpZLG8o89uMb2jKwXisASHC
         Jj4HxzzsYmx1eTjpD3IRdvAoxZmxzGanCm0PaD7XI7+BHoLwH/uV93Pb4KAHswVb0Cpl
         HTkDPlSDkkFwdH0FFnBZMj0iip2U8eb6nrXPkEj8eXEwTshhAn5Y+PT2R18WMLB7wSq8
         XGry/AczJNrcfcB8SxedJ54aW5/Xo0sWunyK8tOuYatwCkc1Q97QLmcpQvyIqePejpoN
         9wOg==
X-Gm-Message-State: AFqh2kqQLpBNgihr1bHyddj8cDgUgb0PkQfH9KYCxEhktqgWUdumcUmj
	QOlInXE0ACXhvQkaY2Gf0jTMVrkbJ4Q=
X-Google-Smtp-Source: AMrXdXszlQ6y65XdA4OM1QOd9axutkTgtNcuFoQlwjfLD8AJzTMH5eg2XNpPSFK3En2bKkfISKXHRw==
X-Received: by 2002:a05:6402:4518:b0:46c:b2a7:1e03 with SMTP id ez24-20020a056402451800b0046cb2a71e03mr67404971edb.36.1673739304112;
        Sat, 14 Jan 2023 15:35:04 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7ae1-c100-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7ae1:c100::e63])
        by smtp.googlemail.com with ESMTPSA id d7-20020a50fb07000000b0049cbd334b13sm1967620edq.29.2023.01.14.15.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 15:35:03 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	neil.armstrong@linaro.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/2] ARM: dts: meson: Add more L2 (PL310) cache properties
Date: Sun, 15 Jan 2023 00:34:53 +0100
Message-Id: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_153508_692502_E08B6BB7 
X-CRM114-Status: GOOD (  10.08  )
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

I had these patches in my testing tree for a while now. The vendor
kernel uses the same configuration, so it probably makes sense to
use them upstream as well.


Martin Blumenstingl (2):
  ARM: dts: meson8: Add more L2 (PL310) cache properties
  ARM: dts: meson8b: Add more L2 (PL310) cache properties

 arch/arm/boot/dts/meson8.dtsi  | 3 +++
 arch/arm/boot/dts/meson8b.dtsi | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
