Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888C606A31C
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2026 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ouhf1YvV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IzC2Qmim
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FlBakAxxN0cNmck9ZdOON47Pf3axz50KtHS07IPNmuk=; b=Ouhf1YvVslUWop44InYBLWYuFz
	LwF+8/pXwcaPalY+OGlb7JIosZeOu4gYVgvxQfjhCT/dP17AePrTzzQgsjGFqAfTNL+xx8eFdh32f
	vPueVGDtF+fJHgThj2f2lt+Hk196pvkIHs6hQa4ozcKFPDDyIqOk9nL2qEuRnIp1Om0NLTS76zB6h
	wnKL1loVVN0hUdE0ikKbsdlhSIL2mOqS7oSiG6YvSX19zD7R5vJwZFfosVb2QaPVMCciMREfrEcmi
	+d4dgp5BuSx2UJtRurqqON4cGQPrRJW61iI/ImwXjy4Mm1xWtBLFawaNBRwfIYIQxbWXYCl35C1ug
	egteLUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQACI-0000000Gh0m-1MHQ;
	Sun, 08 Nov 2026 21:13:07 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQACG-0000000Gh03-0DHd
	for linux-amlogic@lists.infradead.org;
	Sun, 08 Nov 2026 21:13:05 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-6767d92cde6so238996d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 08 Nov 2026 13:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172382; cv=none;
        d=google.com; s=arc-20260327;
        b=JRMdM89VG866mFX81HcavEc7M/bn6h+eGLT9959+7O1ovqBO0ofTCivzKfOwu3ajFW
         BQYMXqxfii4o3ZOZJpJ01VutwkFX6092qwYEGBMoWBFlYDunI/gYZObV4m/seJOT4rlK
         4Ev/NBtDRLZtvbr+7U9cE/DfzhSFt9JeiUP6f8+MSAHgqwJNGwik1/+/DRJXLcWnlSAP
         sYBWUyL7GKpT6k6T1dzbGlUFNLAqOG1xXU/KjV1xEnOF0YrxXepVY8JtP7wPeB/cdnhE
         YLMWlhIAo/3G72NLFH8GEiebwCmeBG6jz6bcVLbrrPVBYndh9RInVPUTrAS6S9GGkHG7
         WKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        fh=mIHam1HwUnDxHgZQ5HiCN5Z94TGqwYQ0PgZg572Tsa8=;
        b=O9FYMK5orM/jRp44T0IlaS/mwZPsRmHKglCuG2LSElZrMKKzgIXDrfNrVesajvNW7Q
         IVaRAl7ijsk6vVpFKPbikLfyB4KJbJjFNjGsQL6NNpSpgt18kpeTpkV0sihx49cC4Jn+
         SyyKszv7KKFgoUdwe5J1h2/jafl27zlLH/Om68FrpsDhMpIXkK4flGHZ5SULJwpYoUco
         2l61NrI1bk4KsWAoWj/PMS64TwJEpMqFGyYg+QFsgyrzYrG1CQd+6FCpYDvUUARDyuGm
         NPVBUIcJqVnA1B19byVb6r4hEOB5zFxz0Qviz3xHGbtIhwHU9xY3nJ6v2rdL2hw1cnVX
         7Iww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172382; x=1794777182; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        b=IzC2QmimKhfNLpwy2jROl1idqlYF5YhmUR+tbjdmW94Va8i9B8Un3Ep8j3mAS72ZBw
         hRWEu8kaOTXqDxsPZWcUBSVZvy91PVLxArXGiV47k58k3CthXPYut+/IH4LVvPVzuMsr
         Exz8zl+kmfBH+g7W/0m7ahiK75JS1xVWJNyGGmWKgiZ/iQT+cKf/ENkXd8n0aC8zLeSh
         Zkge8BQdcQEgjo/LEJ6LbwMEqLszVLcEah1tM8MYUmxZqy93YUXg9JQmBLd0ivTdkkZQ
         Gu/ZM3E2D/qfbS/t8CukN+vJ/QSZXwWYJOKiAVwSj9O/UssK9dxgZuffT/Vp/t1n7Hcv
         cMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172382; x=1794777182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiUBaJeEoNZmSx4wusGC1LfIu6NLX9ueZ6F9sYiAny8=;
        b=0MqIrNHpVnj/SWYFWO9n6dTVhrV3UYGxIIDXv1626szOBFIRMNn+J/W3KfYDmh97Op
         iqJ+cf3GqAmTmSE+4p2rtkzB3umUEfRJhL6BBK4OfsABg+ZZ5exyXmYn8cn3tC3tC1I2
         J8BPc4X6Ek4n7b9mFS9p7T/YfgXnlloXj3x68Q0YoZWIhGJTia5I1SMXIqLZrFMBeWA/
         5eD8UPtN7c0Efh/Bsh5wvq8iJwz/XdlIpvawpaLUfMfKlvRvDgGwghuahVjNMz1VmP1j
         nKFIvVApNGhCn/DeGAg1ICr/OutJJUgWzK013jEjuL0MkLe5L/Xxg62RQxhCrkZyfBRQ
         XHzw==
X-Forwarded-Encrypted: i=1; AL+hErEPFWQ5z9TfwAI4TW3cqv0/O3+EO/JAXnWlBwEtrT4yFnNXo9XLvluW7wIWw+KqXAOa2ai1kxmCKhOBdk8x@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ky+z1ICtr6N+0SxDMOEGL1pZeuGdWB+Wz6QmldsMb0njvKk8m
	suaV3uQM/JED23/g/5LTp+yJB/ifJnxuXwDPlTjcxXgAdfVL9lAqoO4gbJAjmpUPH6Mei+p0541
	H8QKZRA0Vz07+xQ3Y8Xx2dbUZXhpzEEM=
X-Gm-Gg: AYBFou0+CbELbAXbxVX1mqG4c9grzpi44skHZ1XPyEnQ2jugdUuJ+Sga1Sb+/UNajor
	0wtvr91VsbZ12RtDhYJLOYoCYegSQC+TAaq/iPfbC2O5YJ1d1E8tmEyEavFsTHOmBsdXeO/ggQ/
	L6PJJwJ/4xPVtKoyh4bn5gFub/Rf5nfP6cmDHjs1ddiGmmKiK4dQ2ogyBfscN67GftNzAq5T9lz
	5tQD9zGFDj54nYos17nT77goGAXm9fKIdM4NFMccbZKGSbhq/7seEQJ2KPoHB+iR7layiFJ+8ez
	s8pEWWQLg722/a0FZ9BAOzlq0GDy+lG1q9kNGPPHJoqMfvIJd5u6Eg7JeRlGFt2DTntKTLD42MH
	JcOa3jxpfgaKsJU6VVzfaprL31xwQD8VrMOyGnwcXJ/J5L3CXMo8LS0BPoDLTzhXkoUxqfo1lS7
	9ufUzFEjnfbdvLEL8=
X-Received: by 2002:a05:690e:1917:b0:677:ceec:5eb6 with SMTP id
 956f58d0204a3-67c3da75649mr1372951d50.91.1794172382380; Sun, 08 Nov 2026
 13:13:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101913.46664-3-christian.koever-draxl@student.uibk.ac.at> <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
In-Reply-To: <CAFBinCDS_toG+4BySkUoXx73a2JWtp+tD6NHwYHk4mU+p+GF=Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:12:51 +0100
X-Gm-Features: AclHuK-s_rDsDj1PWZlIOcV5ImuQxceuPlDPh6uQEE-d_X3ekVMWkJWbJHC7kWk
Message-ID: <CAFBinCADS55=UYVXRFkavSXQFtpCGG-wiXG9r2PSRWPFnppcww@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal/drivers/amlogic: add S4 support
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131304_106718_F2860805 
X-CRM114-Status: GOOD (  11.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgOCwgMjAyNiBhdCAxMDowN+KAr1BNIE1hcnRpbiBCbHVtZW5zdGluZ2wKPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3Yg
NiwgMjAyNiBhdCAxMToxOeKAr0FNCj4gPGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51
aWJrLmFjLmF0PiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXIt
RHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPiA+Cj4gPiBUaGUgUzQgQ1BVIHNlbnNvciByZWFk
cyBpdHMgY2FsaWJyYXRpb24gdGhyb3VnaCB0aGUgc2VjdXJlIG1vbml0b3IgYW5kCj4gPiBvdGhl
cndpc2UgbWF0Y2hlcyB0aGUgVDcgc2V0dXAsIGluY2x1ZGluZyB0aGUgc2VwYXJhdGUgYnVzIGFu
ZAo+ID4gZnVuY3Rpb25hbCBjbG9ja3MsIHNvIHJldXNlIHRoZSBUNyBkYXRhIGZvciBpdC4KU29y
cnkgZm9yIGZvbGxvd2luZyB1cCBzbyBxdWlja2x5LiBJIHRoaW5rIEkgbWlzLXVuZGVyc3Rvb2Qg
dGhpcy4KRnJvbSB3aGF0IEkgc2VlIGluIHRoZSBkdC1iaW5kaW5ncyBwYXRjaCB0aGUgdGhlcm1h
bCBzZW5zb3Iocykgb24gUzQKYW5kIFQ3IGFyZSBmdWxseSBpZGVudGljYWwuIElmIHRoYXQncyB0
aGUgY2FzZSB0aGVuIHNhc2hpa28gaXMgcmlnaHQKYW5kIHRoaXMgcGF0Y2ggbmVlZHMgdG8gYmUg
ZHJvcHBlZCAoYW5kIHJlcGxhY2VkIGJ5IHVzaW5nIHQ3IGFzIGEKZmFsbGJhY2sgY29tcGF0aWJs
ZSBzdHJpbmcpIGluIGR0LWJpbmRpbmdzIGFuZCAuZHRzaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
