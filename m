Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0E8C4708D
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Dec 2022 01:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wp6V5C10c+CF+IV8HXgNce5wffncWIM0152THUDBz2A=; b=mb7x1b5lKkrO+F
	JGWDDJnX830gvcoIFRDX6+TZwx2uEPKdToiZGcvy/civuwP0+AewuWdqIHNtc0DP1sJaFOI0rYM8E
	xaZhw4QflizLGtOLgWEirT63Ibn0zwu8CmDNOUAfdHTGK1bNE1RmMYwIRGzdKdPwbaLkQxChjNOzg
	E/hDxTjPRhzj69fjjm/URPUm3FnwCvvm9G7ezwC7fVnq9sIZo+UZrx7ZyWrRJOSYMEzOeOtBeOfvf
	fL0kUiIByGE7h7EkjLgAtiBppljxOUFCVsRV8j4ltanBne6TAkQTmX+2g4XrAthSDcRfXYHmNpjyC
	xVLjLQHRhHAgdlSsLJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9cAv-000AFB-5a; Mon, 26 Dec 2022 01:21:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9YW4-00FdS7-6R
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 21:26:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id jo4so23017389ejb.7
        for <linux-amlogic@lists.infradead.org>; Sun, 25 Dec 2022 13:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/E1jZmkwb1esjiwXZMefQocpoKRbXtxkKRar3SCHMA=;
        b=az3jv0s85qiKaR442hQ2uE40XDD1xitIGabb+yE0b1hXUJKM4MAGrtp5RnvBrUbeNo
         v2swLM9C9V8UOav15rdymBS/ExyElRz39AJoxm/pMtzJSS4O2+6/8Ex4HaHbhoxG9a7W
         pFI99tBdvcmVVuLFpNbiTqka7lXP7YA4hbX7DrWC6MWs7oajo7Dp5kGgHQiDjow3BYw2
         oLwpXx+ZaBRYhiT6odPADTODxH6oRDrbvhBebuCwWSieYRa1PVaAzR0TP9PkH1VL7/Om
         gcepUpbf4Z5ohVp+6JeNwWsCABY2C5rMpV/2qVepLu5N4/j/Uu99iJkkI1pJARbY8HD8
         QLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/E1jZmkwb1esjiwXZMefQocpoKRbXtxkKRar3SCHMA=;
        b=eipqb7Xeyrud9tCZxri43eX3ll4ZqaV+DozD+SFIrHq3u9O9hHqoVCH5ENBHVyDuMP
         Ej1L8sxDyvQFejGprS4wus7+34bPPNyvlr/FgIm112VtAN0ZU6j1uJXgHPJrdhkiOQRz
         gDZ1uqgW5xBAP4/637KhwYihjqGiEBd6CDU9CKIDxXzkY9M0Qrz7Hnw0U9zs5O+REwXE
         NUGN8xCCOx0Gje1VSWsnZqYMYqAR8GC56G+g1w4TBO1LkSSFxl0bOtcIzyJ2S9DTqFSn
         4D7FqsIh++IZ/SbkXYJ4cHIvaoU6F+1a/z3HbwSI9BrV44npgpIqBKg7bG+sSc2TuDpL
         WHgQ==
X-Gm-Message-State: AFqh2kqRTbhWHRBhZK5zd6Za2ktv2kSw0ycO6uPeT1mlJ4iqRhsjJGUY
	yG8E71xWfYaYTaQh2UdhZmIoO1De36Q=
X-Google-Smtp-Source: AMrXdXvNfb+HnZA1tZA4Lpc1SIwFbLT4cjW/FBQ7b4LKAbTVQpf6Nwx5iz+9YwBlZ2ksbG/a+Fcu6w==
X-Received: by 2002:a17:906:a186:b0:82d:e2a6:4b0d with SMTP id s6-20020a170906a18600b0082de2a64b0dmr14248970ejy.18.1672003600133;
        Sun, 25 Dec 2022 13:26:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c49f-b200-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c49f:b200::e63])
        by smtp.googlemail.com with ESMTPSA id ku22-20020a170907789600b007c10d47e748sm4062567ejc.36.2022.12.25.13.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:26:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/4] clk: meson: switch from .round_rate to .determine_rate
Date: Sun, 25 Dec 2022 22:26:28 +0100
Message-Id: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_132644_310726_E78C3BFD 
X-CRM114-Status: UNSURE (   7.31  )
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

The goal of this series is to switch the meson sub-drivers to use
clk_ops.determine_rate instead of clk_ops.round_rate. The former has
lower precision (2^31 instead of 2^32 on 32-bit systems). Also the idea
of the .determine_rate callback is that is replaces .round_rate so the
latter can be removed at some point.

No functional changes (apart from the 2^31 to 2^32 difference mentioned
bove) intended.


Martin Blumenstingl (4):
  clk: meson: mpll: Switch from .round_rate to .determine_rate
  clk: meson: dualdiv: switch from .round_rate to .determine_rate
  clk: meson: sclk-div: switch from .round_rate to .determine_rate
  clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate

 drivers/clk/meson/clk-cpu-dyndiv.c |  9 ++++-----
 drivers/clk/meson/clk-dualdiv.c    | 21 +++++++++++++--------
 drivers/clk/meson/clk-mpll.c       | 20 +++++++++++++-------
 drivers/clk/meson/sclk-div.c       | 11 ++++++-----
 4 files changed, 36 insertions(+), 25 deletions(-)

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
