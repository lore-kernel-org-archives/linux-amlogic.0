Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613B7CD98F0
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2026 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nyeoM1QYiKwk7hE8eXOPoorfxL3jfgrDi2ppJt0Gak=; b=hLXJGzECcp2RPl
	VSDvNp7ze+PzC/FdolC2APkFXUwQT7nDaLvXpg9mrMDIOboaJ3WwLVedy52xrGVZuuQT9zG16I1O0
	ucIviBskH8lApKRKRG5nHUxsK0QtEmTGuhyUT9S2zIy4xFh+OQNEx0Ya8fcqLimfSvqKW7R55jhWm
	Q/JxXFEqa630HcS2VgkkETG4EC4GhyGgb8I+r9i6ZijpQBH1q+3XXog5/sgG4nwCf0oXM51IU7XqO
	avuCuyuZA1T34Bd5PK8HnunzODNXGYdY41oVvDePbd9xRZity7CzmvnYBof5kWvNX9f25iNhA2G+X
	1b+Oyz1wdcVxAaEot8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuGJ-00000005klf-1BN2;
	Tue, 23 Jun 2026 06:05:31 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuGG-00000005klJ-2dh6
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jun 2026 06:05:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8422f395a4aso395196b3a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Jun 2026 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782194727; x=1782799527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ef21YKNRKTwE4+JoXHQ8LZhCHi66wbfOD/5s58Gc8o=;
        b=HiGGctW92BIOrw9mv+OdApO0uRIrggtOvgKmSVELO+u9x5c0Qcvtf/6+0Cwp1PQRjC
         2ORkq2qXXNuqo9tNDia5AqC9Ot5j5Mr6WhGD8F1Pz3GpkMc7tQpOtxzg4t7aYDwUz9pw
         IirincJ6zbFzakpGt6UZ5u+VlhnXPjw+UcI53VNw1L45gQYr3Wm6LIz3EzyzutzcRQUp
         zTIE2qIy2FCG8Aimq1kx8HpBtDD4dza5JqyxeHRVgYHNZTdVJU0lfafeePWlo6/xQSj7
         uFtjRhhUTBn492EPQAHmlGdfiPtNKXl8Sny/lmOhiF5x9NB63beXP3Cclet4aJ/R0Xhw
         BMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194727; x=1782799527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ef21YKNRKTwE4+JoXHQ8LZhCHi66wbfOD/5s58Gc8o=;
        b=VmDme2iF7rShdKivnCS35XcQvywZfCJzqSCNNdjerFZGKhAZf0XoQsMCBaWQVPho+D
         qnm84aY8KesdtLkut/SLTibI1C0tMdtO1SWXu9aNDu/RHw7QVqvJOgK6TwFMjOlLTAAo
         IMnN7cJUohmVlCJd+JxNbE09XwiHfxRbCMVPum4HW7GL85ywJrbDPdqTkefKVinU0vIM
         3pG4XBI4N7D7VsSJO+ijnpWhYBWSHTxgs7lxIjw1XkDnnoSXDBeoKR+XqAo976CW77HG
         +d4UkhTDzl1z+wyuAh1PJsIkFslif4k4UPPRa/+3zE21sguI7gehRIsrh//P4HnIUsDs
         J+Xg==
X-Forwarded-Encrypted: i=1; AFNElJ/ldWiK6Se4MLakepvZto6Kv1V+RfER+uNHvnzd++oyXQ0NX1ouA/rmINk6c32EzYtTs9rJTAwPXjp2y3HT@lists.infradead.org
X-Gm-Message-State: AOJu0YyAZ/atpu8HQGwMF4KI42VF472DhWkJte20Rxu+sNs8SgOsS3JH
	rljdxnApFkdORE/BBl4kXEFF2sNnLiRJcQQe7Hug2d6TrS0OuVlPpFrX
X-Gm-Gg: AfdE7clwbqka8CqZG0qdrpNJyzH06Z2FRa9I/osJCNNz7fVdfSfrLBfKw+q15NqZmPN
	Q/2vADFymPMOmEsMpl9KcLSpYejzrh63G6ye4wBjMoJBp1f34/bBU9tsphknHsCvJAl+9WQJxFV
	OXGDbbd/FVhSboJ+agGOhwl/13NEBoyX/wG4uJ7vdRHL8rPdWdQ8pKZMWCsvEMenOhTA8Jwcq2y
	wgUhmAjHfe18FJ1XiPWgwdqgKazpjTeyaP8zbQk+KBJ+PGqn4Iw9gD2cJ0d9jBnwz0xrwnwhede
	4c/IO+JhUhNEtvCPRs6fmvEPz6kRhyrWbSswMbMmc0NHdHyXvVnvMThG428Br/5vhmtQVK0+2Mc
	pc4XZDZW6XTsgKVL86FKy2fc1+K2WVpKWSSDm8WHOpA0XiHFP433X7+X5zizIY+0l6TCA4yEODH
	JWDTkNZdCj9g==
X-Received: by 2002:a05:6a00:2c95:b0:842:5ea5:5fe0 with SMTP id d2e1a72fcca58-84591b260d6mr2136947b3a.6.1782194727240;
        Mon, 22 Jun 2026 23:05:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a57:2041::1002])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ee3dc2sm9160454b3a.58.2026.06.22.23.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:05:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-amlogic@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Tue, 23 Jun 2026 14:05:14 +0800
Message-ID: <20260623060521.599380-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617083401.8777A1F000E9@smtp.kernel.org>
References: <20260617083401.8777A1F000E9@smtp.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_230528_703765_48968CF4 
X-CRM114-Status: GOOD (  19.21  )
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

PiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3Vu
ZCAxIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoKPiAKPiBQcmUtZXhpc3RpbmcgaXNz
dWVzOgo+IC0gW0hpZ2hdIEVuYWJsaW5nIGBwY2llX3BoeWAgb24gYG1lc29uLWF4Zy1zNDAwLmR0
c2AgaXMgaW5zdWZmaWNpZW50IHRvIHN1cHBvcnQgUENJZSBmdW5jdGlvbmFsaXR5IGJlY2F1c2Ug
aXRzIGhhcmR3YXJlIGRlcGVuZGVuY3kgYG1pcGlfcGNpZV9hbmFsb2dfZHBoeWAgcmVtYWlucyBk
aXNhYmxlZC4KPiAtLQo+IAo+IGNvbW1pdCBjZDk0ZDA2OTY5ZTlmOWEyM2VhMzE5ZjQwNmI4ZTg2
ZThlZDllYzQ0Cj4gQXV0aG9yOiBKdW4gWWFuIDxqZXJyeXN0ZXZlMTEwMUBnbWFpbC5jb20+Cj4g
Cj4gYXJtNjQ6IGR0czogYW1sb2dpYzogbWVzb24tYXhnOiBEaXNhYmxlIHBjaWVfcGh5IG5vZGUg
YnkgZGVmYXVsdAo+IAo+IFRoaXMgcGF0Y2ggZGlzYWJsZXMgdGhlIHBjaWVfcGh5IG5vZGUgYnkg
ZGVmYXVsdCBpbiB0aGUgbWVzb24tYXhnIGR0c2kgZmlsZQo+IHRvIHN1cHByZXNzIGRlZmVycmVk
IHByb2JlIHdhcm5pbmdzIG9uIGJvYXJkcyB0aGF0IGRvIG5vdCB1c2UgaXQuIEl0IHRoZW4KPiBl
eHBsaWNpdGx5IGVuYWJsZXMgcGNpZV9waHkgaW4gdGhlIG1lc29uLWF4Zy1zNDAwIGJvYXJkIGRl
dmljZSB0cmVlIHRvCj4gcHJlc2VydmUgaXRzIFBDSWUgZnVuY3Rpb25hbGl0eS4KPiAKPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLXM0MDAuZHRz
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy1zNDAwLmR0cwo+ID4gaW5k
ZXggMjg1YzZhYzFkZDYxMy4uN2JhMjQ5Y2MzZDU2OSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGctczQwMC5kdHMKPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGctczQwMC5kdHMKPiAKPiBbIC4uLiBdCj4gCj4g
PiBAQCAtNDQ4LDYgKzQ0OCwxMCBAQCAmcGNpZUIgewo+ID4gIAlzdGF0dXMgPSAib2theSI7Cj4g
PiAgfTsKPiA+ICAKPiA+ICsmcGNpZV9waHkgewo+ID4gKwlzdGF0dXMgPSAib2theSI7Cj4gPiAr
fTsKPiAKPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwg
YnV0IGlzIGl0IHN1ZmZpY2llbnQgdG8gb25seSBlbmFibGUgcGNpZV9waHkKPiB0byByZXN0b3Jl
IFBDSWUgZnVuY3Rpb25hbGl0eSBvbiB0aGUgczQwMCBib2FyZD8KPiAKPiBUaGUgcGNpZV9waHkg
bm9kZSBkZXBlbmRzIG9uIHRoZSBtaXBpX3BjaWVfYW5hbG9nX2RwaHkgYW5hbG9nIFBIWSB2aWEg
aXRzCj4gcGh5cyBwcm9wZXJ0eS4gTG9va2luZyBhdCBtZXNvbi1heGcuZHRzaSwgbWlwaV9wY2ll
X2FuYWxvZ19kcGh5IGlzIGRpc2FibGVkCj4gYnkgZGVmYXVsdDoKPiAKPiBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tYXhnLmR0c2k6Cj4gICAgIG1pcGlfcGNpZV9hbmFsb2dfZHBo
eTogcGh5IHsKPiAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxheGctbWlwaS1wY2llLWFu
YWxvZy1waHkiOwo+ICAgICAgICAgI3BoeS1jZWxscyA9IDwwPjsKPiAgICAgICAgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7Cj4gICAgIH07Cj4gCj4gSWYgdGhlIGFuYWxvZyBQSFkgaXMgbm90IGFsc28g
b3ZlcnJpZGRlbiB0byAib2theSIgaGVyZSBpbiBtZXNvbi1heGctczQwMC5kdHMsCj4gd2lsbCB0
aGUgYW5hbG9nIFBIWSBkcml2ZXIgZmFpbCB0byBwcm9iZSwgY2F1c2luZyBkZXZtX3BoeV9nZXQo
ZGV2LCAiYW5hbG9nIikKPiBpbiB0aGUgcGNpZV9waHkgZHJpdmVyIHRvIGNvbnRpbnVhbGx5IHJl
dHVybiAtRVBST0JFX0RFRkVSPwo+IAoKSSdkIGxpa2UgdG8gYWRkIGFuIGFkZGl0aW9uYWwgcGF0
Y2ggdG8gcmVzb2x2ZSB0aGlzIHByZS1leGlzdGluZyBpc3N1ZSByZXBvcnRlZCBieSBTYXNoaWtv
LgpVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBTNDAwIGhhcmR3YXJlIGF2YWlsYWJsZSBmb3Ig
dGVzdGluZy4KCj4gLS0gCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwNjE3MDgyMjM5LjY0NTU2Mi0xLWplcnJ5c3RldmUxMTAxQGdtYWls
LmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
