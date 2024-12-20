Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E629E77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m8agUgRz9G3P9swzNcjFcbWrReuYyA08fXQSE+5kQXA=; b=QTwVtIyX9LRkIo
	9phRM1Z60aIfhu5DHGTqzUZCZdN/2jCow98AYmGUSV0YcnnsgTgAfuAWLnFfTBT2lL4m6Cx9gnPGZ
	dC1+6/zQJHd3TMPXmQvLWRa5fAEJOT+ccB3N4Q23eeFr9GSS3usru9LnVCZYTcrrX2yjzcBR41cGH
	J6mAA5An5yWz1IJZjx+7G5QFucUM1bVNyDFtEZzHjJZ8SsX5TvlR8XOFo5Lmwp9no7Nl/RtyjinOz
	VXr6AkT43Vi2TxQJ6e3+doIZUkV0EfxR+tjFGm8QRySXr98x8Bp+1NOB9weJKEmwM66yWOKZ5CJJ+
	IbpTi0lOxo/K6h/MlIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavU-00000004g0O-3Xel;
	Fri, 20 Dec 2024 11:12:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaCa-00000004aHR-0Ytz
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 10:25:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-382610c7116so1024704f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 02:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690347; x=1735295147; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=;
        b=RfmLlkdUCxzWJTMPWHQTdNdR3n82L+QQ6KmHRGiYoQPtGk+6rgF3Jv8QA+aNnp23F5
         qwo5iafC6id/CjFZCssE+PPiVi5mnEdDP7Ww6zWmF7SlqrpWj8oB5QmLQzAuFDG2Vk8b
         +Le++SjZ/V0gt9wx3btKCghfKNtLuBjgHT60Ljr7Calem6kWRkgj8uLZa0/faAAdij64
         EqNYhTrTP0ddbzos9E2ayrDT99Qhi2Rb20SH7c5dClbtYQyMWoF5ticy/2NqGQgp+xju
         DuLt9U2zDa47zLaZbh1CgwiTWx7U/NxhV4WuZEObZr+u9val6YN2nFpU0+fjxwMtkose
         QMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690347; x=1735295147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArM8tPrv2uh4KdQHEvgTbozMB6b4jdDuY+KtgYWF/fI=;
        b=Nke2mzMro5J6dUat8eW/z5txXmmwDzAksHynu7xfMQ4m562vdyn72WCfj1oFkgdHTe
         HPYOhLJ0x3ZRC3HEqYALKHP2OFejmU+t3M8sbIBWZb66QETLZ8qLqPt1JTvKY6/udIX+
         gqbmwVRhJpkDLjJhIXIwb8wB8Z2XRWa5xe6ESrlW5U2ODecJQ13ymndV6pfK+axyAMci
         painDfEGVStpdA0IkOhvjuF2YR4XuxLKHZcKdP8g+PgKh79b1t9XM1W5+bgDkwDQW25r
         FiYhOypbiwmxWBRyqloOfz5sujra+OfJddrYliwXUdPqyBLex69LwKrbNc+vKB48cmgj
         hJ2A==
X-Gm-Message-State: AOJu0Ywv0WfMdbvHCrW0SQjKCh1fRqXgCxvVIeFuDbo+QjYtPT7LVgWX
	ZZ5yjJbPHFcJjZN9Dgs24p/82SHQODdlGEyOxjNRlPDsSUI3rTGy9Pjmp3WBFNg=
X-Gm-Gg: ASbGncvr9IRKRFcweIG003y6SQK7UmGBh4YANAbTNDud30AJobrHAjEAMWOmfrrgsb4
	0NBg9foRnlYW+HoQKlVPJifNOm99zUqXAIfAJRpIPMk8g3rIPJ2cbQ762Zb26PocioWmUCtBzLX
	mucd4lUwP9bpTKCoEjo5xBBhZafzWpLNqSC403T1YXtdRWS3FBJ2vCCSWHv3FXWnTNgAY247ml9
	CL+g3Cuy0JUHrcnBbh/0gxTgfng2rVam/HXjEsVeddAlWK/O+4U/on1ZXtmpwgXtLY+Ego=
X-Google-Smtp-Source: AGHT+IGeDU6I3JVYEfSem+J2xV0n2Yi6xG+7TAsB45iwjjwGCMNga20LBdZ8QfC+b384/f/a7wLSjA==
X-Received: by 2002:a5d:6d07:0:b0:385:edb7:69ba with SMTP id ffacd0b85a97d-38a221f2dd7mr2392065f8f.1.1734690346496;
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: amlogic: gxbb: 32k clock fixes
Date: Fri, 20 Dec 2024 11:25:35 +0100
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB9GZWcC/x2MWwqAIBAArxL73UKtBtlVoo+0zZbsgUIE0d2TP
 odh5oHEUThBVzwQ+ZIkx56hLgtwy7h7RpkyA1Wka6IKxy0cXhy6sKK/rUVFK85yc0KjW2Vt08y
 tNpAHZ+Rf5L4f3vcDFiBzjmwAAAA=
X-Change-ID: 20241220-amlogic-clk-gxbb-32k-fixes-9483bb55f849
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=613; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Pxn7QMrh2zuVgh1mpm3H2Yh7TIOIErliMvP1+xrWdOU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYmb2J+gSyLdTpK/sPBj8t4x//U4xeaezkCp
 /ZLXARVyCuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGJgAKCRDm/A8cN/La
 hSLdD/9Kgjb7cIL/hb3jwTRyvjkgd/W7LkpK8NCMvuA85C3F+hQDQeMyrQZWvvJfR+4N/DNpT1j
 tRqAZHv5pHo1vqPdKxn7CbLquoFZmaAqyjFrmb7sWcOtTCTMHsopVtVEcxaGcvgRN9GiOR+t7l/
 MDIKskgOhs6OKDvMTv2UHir6XvHDpJxHXk+YoX4WhWVyhVMzRUUBOUHWp17LoXP2CJhpKcWOrca
 ViNaFH+oI1syRkM+3RMuVySnyMlrKQOUD9qvxKRzOdDUv5JdiVvciHZ1Fal0Bs7j97e14Kt8fwv
 T76UZtZ5CTTJ41IJdQ5LhgeEdnyp/x+Pnf+118AWQAonf2igoJTG/jUI1je1A/YDBo0d04Wza7P
 co6KEJhWARwtybHrTt5oxVLHRMJYjpAA53M409YhVvngU00gdN+e5YHCtxmIWKCb/04ncE1/QRs
 dOLjHfqDlIlx32dBdovOqcvbroEJ1PQHpTMry9Q53W1o1Q8fyq6Fl2exWuTab45qr0NGQMrdIqh
 yr2XdHkcUxK4Z/4gvNUExaNbYjOuz69JY7nGuq70m2Cbt1CzS133ift2Is9BcDXPQkeDZ1jxf7S
 5+fRqOMkdInSvmY/12eomvPJL6MO7wOdV7GzbmcWg5qwpi/dZyTzbM+eATC0qwN1hGTffyr73FC
 yTDuQaEp4JqosAw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022548_400225_A16948AF 
X-CRM114-Status: UNSURE (   5.26  )
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

This patchset provides 2 fixes for 32k clock of the gxbb SoC family.
The problems were minor enough to have no real world consequences but still
need fixing.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      clk: amlogic: gxbb: drop incorrect flag on 32k clock
      clk: amlogic: gxbb: drop non existing 32k clock parent

 drivers/clk/meson/gxbb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-gxbb-32k-fixes-9483bb55f849

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
