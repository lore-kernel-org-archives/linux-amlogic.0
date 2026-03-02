Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9770CE9B365
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bL8iv6c3qQCaXgqGLFJYwLGhU82ykDnlKckGzPbQo68=; b=eTZOhMiYMVf/fg
	hXm9BZMdrhi86dj32Ec9DYiSbpzKnbd9m2N6h504HL0G49PwuY/7+5Tch3zSPN6T0nLRwt1g6aAOd
	sf99V7NoUc8PJaJEiEyVIOuShVPI+K66FbJ4InXPduiOkmX3OcYLvG+TElBYVmKfyROOkVMk0HWiv
	CVdAqA9FVMU7yvxSZjm5kmNtdc031ZJm+sB7Ctr7ZMOEB3sibWWVkB4PtEhrb3Ke3KDe5ziRBsJTp
	heGVqHX5Jy/M8jVCKlQY0jI4F9bPzsur7jjRfqKCuV1RoM8p4RARJOqM9T/k6rjigjttlTaGzLN9h
	UnZxCsMpKsHnUi8p+qKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1vQ-0000000CtJg-3EFt;
	Mon, 02 Mar 2026 11:59:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1vP-0000000CtIt-0q0I
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 11:59:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ae4988e039so7904025ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 03:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452738; cv=none;
        d=google.com; s=arc-20240605;
        b=RoxTmarR9+JasCFb9tdaMkEAY5a6FuP9pTo+N2F476RnP2Bub5N7h5xRtZC5X+Fn3Y
         9e2AvSDW/JUGYWNPKPbUxArgqowuJZeuhkp0kHybb/95UMgJjb2PrWltBBSYnEMtIE1T
         SdUekbLsB1JDAYCWOPrCV79YMewurOP9mKH70WjJT8mQ4uJHwuVJ1M6m+5YRJZM1mrle
         ci3akSQCYYXAEiP58tVC8HqteLohIYWm5YX6Pv46CP4e9JEtZB3PaKfxPorFiycwcdim
         ShEuyM7wFOO8hnbR0o9cp+/vQ1kPBwnh5ntQg2rb5uDg6/h4+tuRsK9/UmigOYfirVNK
         lowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=;
        fh=cCDYFqTwaTCdIczcq4RB+yiI6VJaCfnAmdyE70cAPN0=;
        b=HEqiRp+m8D5HclB3DCwNeZqWJVJTirgKUtdNbS872/zBGAmBeFGt0PXIYcSNf0OFWY
         3V2+fYxiiqi5AzEjVI6T9BYgPprBt2oYnm3/JIISIivzyuVuac2Rh6Le64aidmFYeCBZ
         VdW+2SBUFgrZBjzjOfRFu1l06LEXXsxP7o7W7xTO8qV+NZFtxJVUQB58f1pHV4btx+I3
         coNjFDKrdDBd+I+tkL5B9R9gdhY6PoSOBa+2XnqzSkRPmRBTwdAcw6aOlA5/jlexGGu/
         q02+rb6OJOsRan21QLhjP7IFiooWOoqgKwY2fgeX9ow09iBTXlKdhV4nXop4aAmblRN/
         7FKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452738; x=1773057538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=;
        b=LL83v06q0K4iutoP1bsV9iYgIAnkLB0EdO+TCCtfZuJMfqc/D25asXvZ88XuUc/JXF
         PpZ64Gbfc7f3NWkzQqooE2+sH9LpzP9VUZSbrjir/pQ4XnG8u2Ff3ftv7VkpampuTVKw
         yjpW3kZukbJDNygxC7NQiCnmrTBiX0f0UfMv+Z42blEe1ejCMinyeNH5wM+FCxzmKsua
         ev1HUHkcHNEhOqS7xmvRlYueWczlKRpaHnYeD9+GvE4qxuVY+ZT5ecQz6Q39AVjyU0tG
         bcLHKaxVgeEjnv0LoRuVM3z/eZ+cnUcqs2Xt9QE4oaaQaUSC+3lxJwG8VI/XZBzlOMzW
         WSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452738; x=1773057538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cn6EW3SsdY/4N0vlnXwNpj8zo6nlR0XbllYn3nMAaMQ=;
        b=h/Yw8v/X1g9STEtHkia8K5YverWPPbMgj7HrhpCrZfa/fzjIu2S/BANQjermTQ8ogr
         ox7RHjvEpKshwTCqDe3CWp/i6mt7wb1+HKDoSrb9Q8wpmAnNwc5qS/mGKzccHvlShOMA
         3B+gups/27VkzsAOzsgkmrEVLDsM1Wpxreq5eR+cSz9kp9Ph0SiIpu2wo5ylT4+KOlVL
         WqlByH5LUZYDz+8khSXkBzEzYELelQ1r1NaNvo7Lh1Zvs5qssgqNQbU1z5OEeRdSHMuZ
         JyEwOYnIR2j+Oy4Fjx6hi83EoIvc189ruPrqoj+36yitBrictAhwBugLJvfE6Uc6tGPh
         BAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLAuiSXUdvn/63ChA5jofgFUiIYdXZfB7OMuhcAmgNw2rUZZ+XnU05SvB/GYMR9xA1DjWc6i1ea8yxMSe6@lists.infradead.org
X-Gm-Message-State: AOJu0YzDFeJ/5K6pxVHBo7JAtafWCb670g2Pi05WUy02p4Sl+m8TCuEq
	TmxsHwoPVi0B3k5/GacSVWc/lCJlffiA4Bntg7pI6utl4V2Hxrx2fDvXMHLVNuL14lt33q+Hq0U
	HYUdpTlRPc14qbf/NkXvOBx38VQxNigE=
X-Gm-Gg: ATEYQzyOpgTtq6+1WcGaWCZbAsJoyNMo3ep0GcuAqAnzf6EAe6oci03kB24WqydUCo5
	zgRtXAjEd4sS9d0vno/zTCZd32daojyM7pqr3WxeF0i92hX02cnSU4LCSYvJXeUJVwAANI0XoNT
	yOtoZAdL6MnNDdlYfaXgUgcggnGFRSVBkQlgDyCRYTTPWT65LCdms3NbjL9M8wYtqzQsxHJQrtM
	Z60Ms9b95QNSdcK/KCqmPwjHugCVZ3VFQBBLJQJ/Sa2LLAHcOuao+Pay1GbrjR7SPIxQa09sfPC
	ew51aS9HjynhtWRDzpQnzQqg/Oou0XgnPD1qNyUq
X-Received: by 2002:a17:902:e950:b0:2ae:5a44:ea80 with SMTP id
 d9443c01a7336-2ae5a44fdbamr8590715ad.17.1772452738264; Mon, 02 Mar 2026
 03:58:58 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-2-nick@khadas.com>
 <20260228-quirky-lemon-reindeer-1045f6@quoll>
In-Reply-To: <20260228-quirky-lemon-reindeer-1045f6@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:58:47 +0100
X-Gm-Features: AaiRm50A5ixOEMCu9AMwpKXYw0q-1sXvRrgscdrkIScH0FsjWH2GNDFERRZkqCE
Message-ID: <CAFBinCAkxO4HoN0Cw0Fc2B3KRLLJqso1p5+qjNN_E0c26VOf2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035859_247025_85C269A5 
X-CRM114-Status: GOOD (  18.98  )
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

SGkgS3J6eXN6dG9mLAoKT24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgMTI6MTjigK9QTSBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMjgs
IDIwMjYgYXQgMDI6NTg6MzdQTSArMDgwMCwgTmljayBYaWUgd3JvdGU6Cj4gPiBBZGQgdGhlIGNv
bXBhdGlibGUgc3RyaW5nIGZvciB0aGUgU0FSQURDIChTdWNjZXNzaXZlIEFwcHJveGltYXRpb24K
PiA+IFJlZ2lzdGVyIEFEQykgSVAgYmxvY2sgZm91bmQgaW4gdGhlIEFtbG9naWMgTWVzb24gUzQg
U29DLgo+Cj4gLi4uIHdoaWNoIGlzIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCBnMTJhPwo+Cj4gV3Jp
dGUgcHJvcGVyIGV4cGxhbmF0aW9ucy4KV291bGQgeW91IGJlIGZpbmUgd2l0aDoKIlRoZXJlIGFy
ZSBubyBrbm93biBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBTQVJBREMgb24gUzQgYW5kIHRoZSBv
bmUKb24gRzEyQS4gSW4gdGhlIHBhc3QgZGlmZmVyZW5jZXMgYmV0d2VlbiBTQVJBREMgb24gdGhl
IGRpZmZlcmVudCBTb0NzCmdlbmVyYXRpb25zIGhhdmUgYmVlbiB1bmNvdmVyZWQgbGF0ZSwgbWVh
bmluZyB0aGF0IGEgZGVkaWNhdGVkCmNvbXBhdGlibGUgc3RyaW5nIGhhcyBwcm92ZW4gdG8gYmUg
dXNlZnVsLiIKCkRvIHlvdSBhbHNvIHJlcXVpcmUgTmljayB0byBhZGQgYW1sb2dpYyxtZXNvbi1n
MTJhLXNhcmFkYyBhcyBmYWxsYmFjawpjb21wYXRpYmxlIHN0cmluZyBmb3IgYW1sb2dpYyxtZXNv
bi1zNC1zYXJhZGM/Cgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxuaWNrQGtoYWRh
cy5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FtbG9n
aWMsbWVzb24tc2FyYWRjLnlhbWwgICAgICAgIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9paW8vYWRjL2FtbG9naWMsbWVzb24tc2FyYWRjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hbWxvZ2ljLG1lc29uLXNhcmFkYy55YW1s
Cj4gPiBpbmRleCBiYjk4MjVlNzM0NmRkLi41NDk2YTBkYzcxNGFhIDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYW1sb2dpYyxtZXNvbi1z
YXJhZGMueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lp
by9hZGMvYW1sb2dpYyxtZXNvbi1zYXJhZGMueWFtbAo+ID4gQEAgLTI3LDYgKzI3LDcgQEAgcHJv
cGVydGllczoKPiA+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neG0tc2FyYWRjCj4g
PiAgICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tYXhnLXNhcmFkYwo+ID4gICAgICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtc2FyYWRjCj4gPiArICAgICAgICAgICAgICAtIGFt
bG9naWMsbWVzb24tczQtc2FyYWRjCj4KPiBJZiB0aGlzIGlzIGNvbXBhdGlibGUgd2l0aCBvdGhl
ciBkZXZpY2UsIHlvdSBuZWVkIHByb3BlciBmYWxsYmFjay4KPgo+ID4gICAgICAgICAgICAtIGNv
bnN0OiBhbWxvZ2ljLG1lc29uLXNhcmFkYwo+Cj4gQW5kIHRoaXMgb25lIGlzIG5vdyBraW5kIG9m
IGZha2UgLSBob3cgZG9lcyB0aGlzIGRldmljZSB1c2UgaXQ/CkFzIHlvdSBoYXZlIG5vdGljZWQg
bGF0ZXIsIGl0IGlzIGN1cnJlbnRseSBub3QgdXNlZC4KQ2FuIHlvdSBwbGVhc2UgY29uZmlybSB0
aGF0IG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIG5leHQgc3RlcHMgaXMgY29ycmVjdDoKLSB5b3Un
cmUgZXhwZWN0aW5nIE5pY2sgdG8gb21pdCB0aGUgYW1sb2dpYyxtZXNvbi1zYXJhZGMgZmFsbGJh
Y2sKY29tcGF0aWJsZSBzdHJpbmcgZm9yIGFtbG9naWMsbWVzb24tczQtc2FyYWRjCi0gYW5kIHlv
dSB3b3VsZCBsaWtlIHRvIHNlZSBhbWxvZ2ljLG1lc29uLXNhcmFkYyByZW1vdmVkIChmcm9tIHRo
ZQpiaW5kaW5ncyBhbmQgLmR0cyBmaWxlcyB0aGF0IGFyZSBhbHJlYWR5IHVwc3RyZWFtKSAtIEkg
d2lsbCB0YWtlIGNhcmUKb2YgdGhpcyBvbmNlIFM0IHN1cHBvcnQgbGFuZHMgdXBzdHJlYW0KCgpC
ZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
