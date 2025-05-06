Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8435AC3ABBC
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 May 2025 06:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSp1oUnVFGTEoCmn64s4yZKpnKyyQxWa3bdksYubAAc=; b=xbTOdlqYdRjkfY
	wgsviHI3UHCXpLxYszuKXLGn4+6HKlS3aBnnII3BF0KjSce1qJbsrG6IKXT5LRhSepAYCsFmPgRrz
	uixqZFehTi4mYxVSsDo6bxTAWYfc0UHjPIyZr2cyFy3VFlcJpeuQ/7nELhHVDQPrW5DveEeIZCSQs
	eEoWaFI/VyRi2QAUXY7PuzszU+dVAcbnRfcnrCYuzY4yAKdBqaTIKiplZmYZ3oRl8Wwo1KiHIPJbH
	AknUVQOgUeTjLkXsI1f30YPRmPlGgUIvfeHRr1mpV+ekbmsyMTFJ6ZUMHBDkEzEjx0+VLU83f158d
	h/ptZa7vNTcQLHVYjrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBgi-0000000AeWD-3N9Q;
	Tue, 06 May 2025 06:21:56 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB2n-0000000AUjQ-0HjH;
	Tue, 06 May 2025 05:40:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-30549dacd53so4494666a91.1;
        Mon, 05 May 2025 22:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510040; x=1747114840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
        b=PGWFus7xxbnmjP7tqRUT5mQthkXkD3kIPJWqs7CAXj+DHTXVAvKVpHhaoNn/V93Mp+
         fBx9VKQRi0Md3Zjmsdd/kzxtspbTtHGxnAD9XUMvu/iHUqsYbu+w8q9cjD3CUZwjdPjw
         vop5AOm5X7Za2lcXBUwltRrdFOBSekCb2JfGQCGLJCJNN4xbEVBqzey6dLz43pqKyk81
         JV5pyRzqAILl83xnNq0NmA17buzlpOFsbl7eMEa3bCwCtaPLqHYRXb4npnxuuJCXikAH
         N3EHZ4uujTycry/n87ML/fgqvSOTW4vyETylk3nlWXUGDdZ7N1LfqZ5jZjqyZ/Y6r7GT
         v9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510040; x=1747114840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
        b=GYDJkMPUKdoSggcB0Q+5cyNGmm5DTAgICZ2C3DrURuNlMRzw0wsOujUIE3SVzGenLD
         8+qEFmNjE/CB/Mem/Uk4LxTszGKjpZLuRxqoF0qGSaEKgcrlHZrcm4z8aCws6V5HRM9f
         NXYLPK8w/gOZif6lgQ6fFeIwgH7C80X5sJElgcgtwzaZ6CCMivYFJ8YUaHW0+UmE0fi6
         FaJeEiyKm5kLm5OgAfQbj8PHaxkTwPrZ3/gwSieISIDrKB+jHV4cetF6JfPn8WRoGDhI
         BNSbCfbSCTkoN4fpwJpQg5xeTId7EjUJai1PYX+JyEINqdDsGCZw/oHXiclbFeMBtZbv
         BeRw==
X-Forwarded-Encrypted: i=1; AJvYcCX7h4DXdD6JeSp+6gGzb5wix7tKJt95q9jWx3bJVb/YIA05ohNz5rjt0DHiGVeVAX3EJGQ+jdBSPW8GGdWDgm6+7w==@lists.infradead.org, AJvYcCXC0U+mn0UF9IH6bClsKUNHzDfmyqNSESA1sFvVfoQ3dkVmngvagqHFx7WXy/9ZLnQ/DC0PUXeBlR+Ku9tK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw74XmzZ+37RD9jtwhqTpr2F1XJBv8iIWl8hQlNZWSFKtdWyIAG
	zpNElWO6gGZiBrGXgVTRsz9s+Ddq5yxvxeu0IG/qqhOwaGx+fr/CliY2vkmzb7npT9Ca8yDs3t1
	wTmMDxju/PEVGUreV/Dl7wTVkgs8=
X-Gm-Gg: ASbGnctX8cedA64+OjOHzOIc+8b4Wf07GaGt/K/cRor7Nww6gijXBHo3Q1acZSewTjS
	y6iAzwmPzZZKD8pFNz40Xqy+4KqgYrlBgBMMK+h4S6NUHdFu3oMdW/d0mTgJ1GX2oY81THFUEYJ
	OZpVNQMUbz/04qw8dXnrS5jT3fsKhhwdSesMuTvXrAeY2Hodg=
X-Google-Smtp-Source: AGHT+IGH2VPUNqhKP0n7asYw5iLX2WnGWqBav+nif7/SVHvaSVRrallgXVrGMUXr17M5pJMS8YFYExxZQjpe5eZ+A3c=
X-Received: by 2002:a17:90b:380f:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-30a7bad3792mr2973119a91.4.1746510039781; Mon, 05 May 2025
 22:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com>
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:40:28 +0200
X-Gm-Features: ATxdqUEfi7YvCZqVRTEcgT4RIKU17ch-N4bMmEbxaRpKJa39QnO_szEOKK7kln8
Message-ID: <CAFBinCD2wHRfP+1i+pUwG0FVNr0t6uHPxH5uetbJN=RcQC_A8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224041_122918_B7505F75 
X-CRM114-Status: UNSURE (   8.14  )
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

T24gTW9uLCBNYXkgNSwgMjAyNSBhdCA4OjQz4oCvUE0gSSBIc2luIENoZW5nIDxyaWNoYXJkMTIw
MzEwQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDb3Zlcml0eSBzY2FuIHJlcG9ydGVkIHRoZSB1c2Fn
ZSBvZiAibW9kZS0+Y2xvY2sgKiAxMDAwIiBtYXkgbGVhZCB0bwo+IGludGVnZXIgb3ZlcmZsb3cu
IFVzZSAiMTAwMFVMTCIgaW5zdGVhZCBvZiAiMTAwMCIKPiB3aGVuIHV0aWxpemluZyBpdCB0byBh
dm9pZCBwb3RlbnRpYWwgaW50ZWdlciBvdmVyZmxvdyBpc3N1ZS4KPgo+IExpbms6IGh0dHBzOi8v
c2NhbjUuc2Nhbi5jb3Zlcml0eS5jb20vIy9wcm9qZWN0LXZpZXcvMTAwNzQvMTAwNjM/c2VsZWN0
ZWRJc3N1ZT0xNjQ2NzU5Cj4gU2lnbmVkLW9mZi1ieTogSSBIc2luIENoZW5nIDxyaWNoYXJkMTIw
MzEwQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5i
bHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgoKVGhhbmsgeW91IGFuZCBiZXN0IHJlZ2FyZHMs
Ck1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
