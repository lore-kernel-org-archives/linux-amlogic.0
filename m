Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383BFC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bOu4nIjvPcu//4nBiNzXDlzv9XBlHlwOjxZzmcTz2Cc=; b=jgGdSsWoKMlhJ0
	EWh9F7ZlmPouqMh38YUTYOcJxkFhG1pzGBi9Ctq+FRVBt0e4j4aTkC4frYZKvmNz7OEVIyqRCNb5M
	qHMpWCKuStqa74YgEQQyS6HskdznTWJrvjA7sWtz1UD1qE/CneLWSKPrk/iqtSvQZs54QDi9hm/VJ
	k0qqVphc/UezPkxCNNBB4Bryb+Rr7dUiIcx1qGvyeJII84GYx0ulrotMLt+N3D+FZ0cNH1GGY02hp
	SSSAsvdTcEjzoa+Us54O8MC7BF50ebfRmVKKXHUKy7dcxSNexURXNYeCu9+ZRGL/gi8GP6NsAXeBR
	QuMfHs2M2ScWkBqqxAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0Dy-004Yr8-RL; Tue, 30 Nov 2021 10:18:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzxi-004TjH-SA
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:02:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id c4so43091014wrd.9
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxGGLWiQP1URa2RClGBG4bbowEUOqfLTXCyeksWHJak=;
 b=5f8ABW1zZtNjGY52IL+i4PbJ8cbZ23szB0iWo74difvp7IqT+JD6Kk7CCUo9/v+RgB
 /asJDH/j2rKieMVdk3LNhgKhxYqU6ZlIoNd7RJiEhOVFJdjfuqlKUYEtQ3+R/9ZAQ7YF
 6Vyi9+FnEgCXSWWbo3uskTucO22yeFP3INDaiejKeth45Dm0ZzjKdOsazQZTnJOH7jsJ
 D3+tAkMNLepuDlMZRXESq5FPZjiN1Jf+uAGzXa7xpc4niNhhUSKk0msiVF9wxwLQ6rth
 9jFf5jnK4wdJaeq95/6MAAws+UzpLE/zE6+Ocw5BdCz0vujXP8YvNMGvQJBAmqC+X1vE
 PCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxGGLWiQP1URa2RClGBG4bbowEUOqfLTXCyeksWHJak=;
 b=QobLWJ2XsImqR8tQxhUjG2KVuwnCjASEhbKqlK0u0YeYKA73PENZWZn/kbIZUOnnEW
 UoZKUQRj2oyfwMKjhaKQpMGQNnIurq29yfHwPJL8mtS2wV8KgKdOPAmTp68hkHzZCXgS
 3YWddzGqqfg7fhlHQg4i5dG8wounfCZGFM2u1z5M/9AUM9voXbR6zYVp3mKCh8y5xW0X
 CeywMzDEBjQs2a8s9M8UQn46In9HrMNiD2N0LmjkV5TqD2TQQhWSS/NZO3TiEAivf+kq
 MCSTXUJ2Isx8tSavtkdgVIR3x4FiUIgmFgq/QdSVBRznkxJWaqXCXK/iGeY25ZBGoKHH
 GNAg==
X-Gm-Message-State: AOAM531oZaKNYclITLy+ypNB6vLOxfJpK0naOuz6g1ki/8UEbAZSWr1R
 Zx8EGtlO7NMhMh+2xsddJWujanYRqXbDxQ==
X-Google-Smtp-Source: ABdhPJz0zFU+8v8aXJOMRSoOlU4RtE0adVzFNEOwgHXFlg5BrDaJcdOIuhVOgvZz+Q6A+FYiEFmi5w==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr37714903wrv.102.1638266529024; 
 Tue, 30 Nov 2021 02:02:09 -0800 (PST)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id e12sm21117166wrq.20.2021.11.30.02.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:02:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: meson: p241: add internal sound support
Date: Tue, 30 Nov 2021 11:01:57 +0100
Message-Id: <20211130100159.214489-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_020210_950077_954540BF 
X-CRM114-Status: UNSURE (   6.66  )
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

This patchset adds support for the internal sound card of the s805x p241
reference design. Audio is available on HDMI and 3.5mm jack connector.

Jerome Brunet (2):
  arm64: dts: meson: p241: add vcc_5v regulator
  arm64: dts: meson: p241: add sound support

 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

-- 
2.34.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
