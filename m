Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4780C3DA6D
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 May 2025 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ayDptxA6C0BRhkTf+05EbljiuKqo7+0bYyMjZd/zkD0=; b=3iJFaeFTId67y1
	AuJMpEIoAUPtR9TKsc3nxVGEQrSlAu7QNemcpkQmgzTwwV6Yc33luKksZy2kutpGKkfs8ewrOgHBk
	+4yPmhdFRtbUxJrCLDnNmnGpG8Xcf23MY9oCbocfzhqaF+F3Kxe2gzOCy2IMoUEnL+uliVzbMUulY
	WTcUWsFynk2d48slvfyO12JFNrYFxWg/Kl1zJq7kmBcJ9NTnzurDZkk8yBUnYL7OovEM7QqQpdfHj
	E0wy4KkXuP78izfGSOGJA2G+LmE5yQbIqGhlcRSK41lv5tawS1POafnwTNkOqGJ/nYMT/u0fNurEI
	MkX1psziOwcoA+Jcvl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYTU-00000000hcS-1KTI;
	Thu, 15 May 2025 13:18:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYJB-00000000g4K-1Kkt
	for linux-amlogic@lists.infradead.org;
	Thu, 15 May 2025 13:07:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-440685d6afcso10053555e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 15 May 2025 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747314451; x=1747919251; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iDfRqwWfszcqhqCUOCGRTjujtzBxRWhvCOesR4XZCXc=;
        b=2+0qe9Gx1COVVsWq9TxTEFm+8T/C8vVBkclfodVYTcvoM2+6KR1gJnadbaWpkeGrDD
         0k9FIabVWL2SRlZelsX4MAvaHpwMdcT9xVZs8PJMhIsAoFZu92JdSGDFEXdJUkUU7q6t
         Yb0FaFFhrfmpO4P8m7TIEw9i6qStxGmTgLgGXzZ/KEmHmd2cj8WhyBv3Q6q4UFWh+YmQ
         1oOvuEpWF7UbCrQoIIZ5PSwXvjBobmoYcnHzKCSljoYKhPgkFaU8PvwoVNScDFYeoHSG
         L4DjLTFGvHJZce2sbEt5ro1zFWaFpzo1wrnEgxjkS8Ron5txnGFiZyKVgQH8L7oRq4N0
         ZU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314451; x=1747919251;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDfRqwWfszcqhqCUOCGRTjujtzBxRWhvCOesR4XZCXc=;
        b=RvgmnP8F1KjQZGS5fm25P7/PHrqtlWiJl4kn45GYSwv3TQnPxaGheKgpVFeRX6TcoP
         b8PwPDoXnYZVx7s7/d/Zl320MpcU+GCnqXCt7l3m0aWk2zQs8hcBXiAStYR78Jzu/5uY
         Ajt9x7ZwGd+Ue2XVaHYJb0MjXOyDs3lzXCI+fne6gct3kWqxA3I00lFn7TpjTgiZMn8p
         0ST9vM3Dp43Dn1TuXBTV9vVuRWqcrIGofPQnTTaXNHoXQa33abg5KNOMLaW8Jyjeiv8Z
         4a+0Sc2oVJnQVO9cMzfOxeFI+7JM0DvcYH7pouf4vN6QV5sKCkvuBJ6WvPxDpI8v0gEh
         2Iug==
X-Forwarded-Encrypted: i=1; AJvYcCUDxn80N6h9RUZ6sM+adOZ3bi1F6NPpj0IodqrgBv7ljX4w1XlqaauVrgfGUauMfS/QE3cMGNeVDdDctsXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwFoVgdhUolgmC3o2YKDWbms6gD+WIh/YONQZte3SAInzeYRRJ+
	4slKp6S/I1U5crDKeewbmQWlM35gEGHdwDLwUpbHOXQ6YKtk09lcjBAYRazh48Y=
X-Gm-Gg: ASbGnctZnNcsHMEMdvaMBR/oGio2W4Y0miQZZfNadhCdPNVXlcCUWWo0+Kfm95Iyb7i
	X+kO32oDXjtPilifpniV5bmZ0F3d/HYZAgfDwzUsjpmlvtoECUDqtL0YV6Wsa1zvPb4e0kbUVy2
	5C1IenITxJOuLobFixG8P/hCqQeISmBota8dcZ/4pSw3ZLEAAkEerk9+q5brCr9ZnvKjudKl2ha
	e1PkO8k4wjOUS8SMaRQg29zDm1tnu+z64uLrwfPW7CdP2W/pnqsujw4fh/emAlumHw6P4UUjdBE
	kNMXBNXeCZBFNV25VJtpcBlX/Jeg49dVbD/RT0FH1Q3KYxoff6pP2LEazi7IVQ==
X-Google-Smtp-Source: AGHT+IFzTwr6XrgpHahEDEhk8qmO3Jyl7d4MjTwz9FJVl2SaaSHYZKmfUjsNvoEcZvjzAqzfyAW6CA==
X-Received: by 2002:a05:600c:a014:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442f970aa63mr20565245e9.21.1747314451351;
        Thu, 15 May 2025 06:07:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442f3369293sm70577055e9.6.2025.05.15.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:07:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.16
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 15 May 2025 15:07:29 +0200
Message-ID: <1j4ixmxbse.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_060733_355836_B21DA21B 
X-CRM114-Status: UNSURE (   6.67  )
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


Hi Stephen,

Here are the Amlogic clock updates for v6.16, just a couple of simple fixes.
Please pull.

Cheers
Jerome

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.16-1

for you to fetch changes up to 0afce85ed26c73860bb6e99a0657e1d90d533256:

  clk: meson: Do not enable by default during compile testing (2025-05-15 14:44:50 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.16:

* Fix G12 SPICC clock sources
* Compile test Amlogic clocks only if ARCH_MESON is set

----------------------------------------------------------------
Da Xue (1):
      clk: meson-g12a: add missing fclk_div2 to spicc

Krzysztof Kozlowski (1):
      clk: meson: Do not enable by default during compile testing

 drivers/clk/meson/Kconfig | 16 ++++++++--------
 drivers/clk/meson/g12a.c  |  1 +
 2 files changed, 9 insertions(+), 8 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
