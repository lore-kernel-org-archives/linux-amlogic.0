Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E5DC77B7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tkVB+kp8zBhV3gUnWz3LKnbCYY2a+YtaG8u3zf1yx0c=; b=ukT7iL3D/moocI
	YiR4KSjG1lrx8OgKkGyCySayjfMdNpuoUnjwEJzUWTrounYjYEYeSGcFZRufUz35/2KIFhed1wPjA
	GnhPZ0pGdK7bsEl+pYxSxpJJvMlOEN1sh3t45BhhU7bjaybODeCkRMA+l0nKgieE5HbET6/ipZWLu
	tClH+YssdpB3A1GVjwjqOMbpU2//lhC+ZmmwywMmuBUGkqC1pToB0EknmFFlj1DDl7fvDXuzWlP3K
	lYnwi8JYvQOcfmR9ZqOmvz1WIixS8mFU8jWGZaTcuBLSBtHcW3dtuRBH7haKzTHEfu1fBmSplgrek
	zj8RplzyFwaNBB1SmXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMbC-00B7WT-0z;
	Fri, 12 May 2023 06:49:54 +0000
Received: from first.geanix.com ([116.203.34.67])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxMb8-00B7Ss-1I;
	Fri, 12 May 2023 06:49:52 +0000
Received: from xps.skovby (85.184.138.13.dynamic.dhcp.aura-net.dk [85.184.138.13])
	by first.geanix.com (Postfix) with ESMTPSA id EA71C4E50D4;
	Fri, 12 May 2023 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1683874179; bh=ftg3uIR+C7op/jYgo/Ad5XVflC5LGRCa0S30bZueYD8=;
	h=From:To:Cc:Subject:Date;
	b=CkHB8fFwaUPSp3vdx/UHgxaMip2Lp7BU1d/yW23VIBKOMM/EonZBRCy4EjZNVyDG0
	 jQeBANogMnw6wYt7a9jjf+1BDWOlqOCtAy4PaGdb2vmpE3xxShwW570J9xMfbltmz6
	 hgyU8J3C6Q4zM7ybUR+G1AxgNIplLB2cnxPEWUZIQX2zB2HeYPG3Y3vl2PBKHc46RD
	 r/yvMLCpfwXx36UcmpryPAFiQKJWgHc9Ar8NVnbnOv1f/4yPqE9b46w01XKoYWN3dX
	 VjQPEevgaRzaUeFVSV8NGVrf99b4sbnpGeaOpSoRduAOJqvCL6xYQOKNGUxpprbi05
	 6GkaQ8hXlbFZw==
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xingyu Chen <xingyu.chen@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
	stable@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] pinctrl: meson-axg: add missing GPIOA_18 gpio group
Date: Fri, 12 May 2023 08:49:25 +0200
Message-Id: <20230512064925.133516-1-martin@geanix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_234950_921545_FCDA0428 
X-CRM114-Status: UNSURE (   8.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

V2l0aG91dCB0aGlzLCB0aGUgZ3BpbyBjYW5ub3QgYmUgZXhwbGljaXRseSBtdXgnZWQgdG8gaXRz
IGdwaW8gZnVuY3Rpb24uCgpGaXhlczogODNjNTY2ODA2YTY4YSAoInBpbmN0cmw6IG1lc29uLWF4
ZzogQWRkIG5ldyBwaW5jdHJsIGRyaXZlciBmb3IgTWVzb24gQVhHIFNvQyIpCkNjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0aW5A
Z2Vhbml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgZmlyc3QgbWFpbDoKICogQWRkZWQgQ2M6IHN0
YWJsZSB0byBjb21taXQgbWVzc2FnZQogKiBFeHBhbmRlZCBUbzogYW5kIENjOiB3aXRoIGZ1bGwg
bGlzdCBmcm9tIGdldF9tYWludGFpbmVycy5wbAoKIGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5j
dHJsLW1lc29uLWF4Zy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1heGcuYyBiL2Ry
aXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWF4Zy5jCmluZGV4IDdiZmVjZGZiYTE3
Ny4uZDI0OWEwMzVjMmI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3Ry
bC1tZXNvbi1heGcuYworKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1h
eGcuYwpAQCAtNDAwLDYgKzQwMCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbWVzb25fcG14X2dyb3VwIG1l
c29uX2F4Z19wZXJpcGhzX2dyb3Vwc1tdID0gewogCUdQSU9fR1JPVVAoR1BJT0FfMTUpLAogCUdQ
SU9fR1JPVVAoR1BJT0FfMTYpLAogCUdQSU9fR1JPVVAoR1BJT0FfMTcpLAorCUdQSU9fR1JPVVAo
R1BJT0FfMTgpLAogCUdQSU9fR1JPVVAoR1BJT0FfMTkpLAogCUdQSU9fR1JPVVAoR1BJT0FfMjAp
LAogCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
