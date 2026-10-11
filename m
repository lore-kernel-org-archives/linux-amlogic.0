Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F145CA9EBD
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgQxb6479DMT5zFsJ5wStJiNrbmHLmsohdgAKrEMLJ4=; b=iZxRPyNAIWHMM1
	X9Iq47zSvzKkcnBWMqrrI+RlDuKfCoU5wTYcgo4ZZyCqEQb7Aglf/GmS5+lJ6xiFjBf0YQnNjD4Xx
	s2p2m3aU0+RBOX0V6riycXq/RUJ++qCrAz1qh1dFdJKeBh7yjirR0xOApNdDVJfENcwnvN0mejKRC
	zBbeloaKf6UgtBZZJXQCW5gdlryThy+NeFWZf9P8SoXLBxBmtYc0wGLG+yVmj9jP02EjQTFQmHQ6W
	vpOnIq02zwZz9LZsv9gPnnBbOqyZ1f3SVOIdADEuL2GzGVJ4LdgN5Ld36Br6+vIhMb6hcyJReQ6zb
	oWAh/Cni++jViljmVTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0L3-00000009Ovx-1CEQ;
	Sun, 11 Oct 2026 20:40:09 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Kz-00000009Ov1-1UPu
	for linux-amlogic@lists.infradead.org;
	Sun, 11 Oct 2026 20:40:08 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6740e7ae219so787440d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 13:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751204; cv=none;
        d=google.com; s=arc-20260327;
        b=gnH7l8GK6Ao7xn04UVNGZ+w1coXoEIb3EIX8tG+exwe7qye/YXjsFUm6Rt3LGSTwIb
         Ka9h5zL8Uq0DWg3MDYwfAxXBqryZqKYcoJeueku353n0PwfDMVZJ8P8h8Kd0qdW9fRqw
         zMPdChjjiHr6aMQBZ/MI6WhM+rhSHDzRoeMa+Drdze5m61ImYgjQOPXPnDYPquVDWSrU
         WE0PMOgEaIMDx3J+dJUS1nFKnZpJ9AdXhSzjMiXnvvD2bfJAl2RFsO8Ai+vvI1ByCQap
         Oy5OQq3PGxejXUHtYoW095ODOLPxuqNX97vuG2EfSudmdswQI/RLo4dCdePF074a6c+Q
         JANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        fh=pLQlngBSXdk0beF0JckGtSVunHvy1cDWbCml6+NZcP4=;
        b=XQCMchLz26ViIjCJYatu995HvJdXuGplz3VDMAldGchiFl3kE2r+wGurIdvTAmVeeF
         lrGbbTgboYgeGe80ZLImRdzx4vM8/WVGnelVtJ/afgm8ctJ8RPH2sXQZVmK9Y9SbBqaF
         sOOHb1YMKjrSCgoN1phCTzPT6y7BV/jy3A9+9+P9dgNiPrqp/vVlC+phzCtLDpfY3fnU
         Kw9PVwrkb5mlem4Fai3XdpjEt1Ciua0D/gdSZYmMJjmP9WtC6Cquu2PTf0BHl56qGW6l
         xURlpEXsxppB0M3Rj4hp6fPPVy/XxMvTq+ajlRmzMsuEwpoh/Z309Z2Bu703F3AIAoER
         J3oA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751204; x=1792356004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=WyDbr84IRdP3d7uvrrDwdOHFpoR3XWy5KcxBw7EK1NbQYvQwPzbK9C0JJq8DG5qEqw
         zPbnLzEIYYunNodSBMJOSzs2ljKLk1OyQkuVnMbZmb/TykH3mb9JqlAnGRexxrWtBSas
         axIM5KeVS6W0ZlHwCdSp3eP4GkaMT6bS0H28BG31mzW1w73iHioDx9h/qDA+w/lGgDQA
         K3Zc49bwdpzBBEzPekipd9CrkVLhOBbtdtYE11/J4DNpENqMra+OvDkCJhyHHVS3lHXM
         Aqy9UpcAcoWDAgygN4AnNbEBK0lER51k48i4I22AM0WLoKrbAkNoiZqPA8s2q+rCxPQQ
         vzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751204; x=1792356004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMamgJmk8vH3egtGQxv4sn3Q+mvCzsBokUwIGTdvv7Y=;
        b=liUJrKkYu55PlBTK/9r/jP46Va4d12JBKBj8izv0JIYhlOsIRGQ5zzItNkZxsJpm5s
         uz43xLnkIxQllpEgJr/A66+Wjn2HUg1KrLn3qbowDigyT9MuQVE5php6eirztCVa0S9J
         U1yabDwjPrq25SnodSubgetjH17svEYzTVZdbEIxfHmVFTyDPHFpu0ZdI5zhvk+iixsa
         DvJaC82A5/4zARQoH3qcntAvbftfema9xGgW+OwNEJ2vlAQ7/JDFCkpsBQIXAqbJagOS
         sjeLLeeFKJ5IEdot1PnDctSUxTDrNd+u4f7IKYuPPZXSg+0rJMKlfu1B4bHkuv7IaNWS
         0IGg==
X-Forwarded-Encrypted: i=1; AKwUvByEcejkmY1EfWLosZeutszDiSS14kAB7MHNBQLas2dvkpuGsFH3kciNpSMUuc90mOSNV3exd7UqVz2bzga+@lists.infradead.org
X-Gm-Message-State: AFq9FYLKxbJHh3IjaNYukFjlbh+0o42WdTKaYpQ/Rydr0DWd7e2hQFr0
	EXTnXovLziUBxKe9/O1UinzNMzaqGcGcrrZgDFooN7f+4dv8dmi/Q6h9H8dZpc1vdocbm8q07Tv
	5U8k/CG8KDqZJRaOsZ8ryaVq4fOTACKU=
X-Gm-Gg: AYBFou2VvuNxE1GtV+DAdM73ETH+CXwnzR2wJWnRYZBkIaWjb1YyysZXsm6ZdLzAEjM
	g4SYgbtlcCKwguJMAaovMT9CsVn7ZbDJ5Tkk5Iju4m6K360DiHzaGR0nUDwkPNXA1KfTkkY5cg6
	ZLaD8zCdtJIi+P6/H5dbJ75Y86NxsHkRnjjish9lj7E8KNF3Qw7n+zrS07GRwbXOQug0w88lOsH
	QPpBZ+5sIX9Afjh6cM15qhh8eEz2+xCQR+nm3inYRHr5j6LoWdsH3mceRZAMxRlFTRQCdFGCbwz
	ovu8r87G4feVFH54Ghh1sYtCcy7I2HzBEVsHUd5zpF4loeAWtg+ZIbhfHh4LLp4djXNoK2NshQl
	swtXTF01Q2+bg
X-Received: by 2002:a05:690e:1519:b0:677:af43:e258 with SMTP id
 956f58d0204a3-6793629ea83mr1945754d50.117.1791751203712; Sun, 11 Oct 2026
 13:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:39:52 +0200
X-Gm-Features: AclHuK8O8IYZ2ORxL6RhWYJwVEzArYZ9TYqeOkNcn6oWSppRxLJliDi6XNzarl0
Message-ID: <CAFBinCAwqKZcUegwsFzom6398-BVmBFH8sekgyDp4ZPm8qYvUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
To: filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_134005_990099_6EECEF85 
X-CRM114-Status: UNSURE (   8.58  )
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

T24gU3VuLCBPY3QgMTEsIDIwMjYgYXQgODozMeKAr1BNIEZpbCBEdW5za3kgdmlhIEI0IFJlbGF5
CjxkZXZudWxsK2ZpbGlwcC5kdW5za3kuZ21haWwuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4g
RnJvbTogRmlsIER1bnNreSA8ZmlsaXBwLmR1bnNreUBnbWFpbC5jb20+Cj4KPiBSZXBsYWNlIHRo
ZSBsZWdhY3kgbGFiZWwgb24gdGhlIGJsdWUgc3RhdHVzIExFRCB3aXRoIHRoZSBzdGFuZGFyZAo+
IGNvbG9yIGFuZCBmdW5jdGlvbiBwcm9wZXJ0aWVzLCBmb2xsb3dpbmcgd2hhdCB0aGUgb3RoZXIg
QW1sb2dpYyBib2FyZHMKPiBhbHJlYWR5IGRvLiAgVGhlIExFRCB0aGVuIHNob3dzIHVwIHdpdGgg
YSBnZW5lcmljIGJsdWU6c3RhdHVzIG5hbWUKPiBpbnN0ZWFkIG9mIHRoZSBib2FyZC1zcGVjaWZp
YyBjMjpibHVlOmFsaXZlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmlsIER1bnNreSA8ZmlsaXBwLmR1
bnNreUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
