Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7851ECD4851
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3Nvw6zHLK/fRXgs2l7eMSOUaKcH6kofAO2o34Ub0jc=; b=OUQNK4Da+FLaTl
	fW/dvmI9Xi6nu00IHx5AW8HB6Xrg0x8UIhoLzZp9z/a5u4DI24ibU84NnwTg7JutFY6MRiDjfGNMy
	7J/mJkgVcPOCquKegreZvCTSiKmn+GX8IpBflzF+S6miL2CCh9ISoW2gD2irztVSxBlRmjCEerfQP
	3vorUWpNvNCh2CCAIXnN6sNVW+nSBimkjz4jzbb3WAzUEIy6rZAB+tD8ZX5OgrP+Gs2jEA6r2nAU/
	tLtNvPf/z6T/aWKy8R15ax0hbGoLroOyR3T25/pLMR/isNpX9Mqly6uDNqBgNlFdv7Pgnyj/4Wbfj
	k9vp/1udNhKs67qx5Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKeF-0000000BMoN-0xbv;
	Sat, 16 May 2026 19:26:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKeE-0000000BMo0-01Xt
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DD7D60141;
	Sat, 16 May 2026 19:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A207EC19425;
	Sat, 16 May 2026 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959564;
	bh=ef+UkxFdMbpVT2NPKQmyoGf1jUZgVYz3lXta2hb/PZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sFLEsRoAKghj20mp7757vElwTZkZnPkc7EonF+DuCZZ2eJZXWaNCKXJpFLRNMQr5R
	 odcR4SBo4nq3+KrLi+3KRcOQMDRJ0l8dK54U0lQNlULqTQRUWaUk2KMJjQX3ODlk+W
	 C4lnZC1jc1mndpmddDs4UadM4iOwW3cIj5p6INUdBJgdBhV3FOnJXohJhxYoL3HjOo
	 uGPd8lKf4zhDTqaHp/TGQjVCFkQUeWCx82p4I6xoJNxmx2qAPjKrKXce4STlT2dVqw
	 Je3TjKqclsIDNauZ4ALbtOTDGZ359OnE5no5LBqcP4L922VyWbcSyOtrpNHLYjpXgA
	 qfITJcZw/aE2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/22] drm: bridge: dw_hdmi: Use display_info is_hdmi
 and has_audio
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260516183838.2024991-17-jonas@kwiboo.se>
References: <20260516183838.2024991-17-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:26:03 +0000
Message-Id: <20260516192604.A207EC19425@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIERpcmVjdCwgbG9ja2xl
c3MgYWNjZXNzIHRvIGBjb25uZWN0b3ItPmRpc3BsYXlfaW5mb2AgZnJvbSB0aGUgYGF0b21pY19l
bmFibGVgIHBhdGggY3JlYXRlcyBhIHJhY2UgY29uZGl0aW9uIHdpdGggY29uY3VycmVudCBFRElE
IHByb2Jlcywgd2hpY2ggY2FuIHJlc3VsdCBpbiBpbmNvcnJlY3RseSBpbml0aWFsaXppbmcgdGhl
IGRpc3BsYXkgaW4gRFZJIG1vZGUgd2l0aCB3cm9uZyBhdWRpbyBvciBTQ0RDIHNldHRpbmdzLgot
LQoKY29tbWl0IDMzOWU1ZDZjNGNjM2MwZWU3NGE5NDI1YjhhOTRkYWJiNmEwNDRkNjkKQXV0aG9y
OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Cgpkcm06IGJyaWRnZTogZHdfaGRtaTog
VXNlIGRpc3BsYXlfaW5mbyBpc19oZG1pIGFuZCBoYXNfYXVkaW8KClRoaXMgY29tbWl0IHJlbW92
ZXMgdGhlIHByaXZhdGUgc2lua19pc19oZG1pIGFuZCBzaW5rX2hhc19hdWRpbyB0cmFja2luZyBp
bgpkd19oZG1pLCBhbmQgc3dpdGNoZXMgdG8gdXNpbmcgZGlzcGxheS0+aXNfaGRtaSBhbmQgZGlz
cGxheS0+aGFzX2F1ZGlvCmZyb20gY29ubmVjdG9yLT5kaXNwbGF5X2luZm8gZGlyZWN0bHkgaW5z
dGVhZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBpbmRl
eCAxNDAyYjM5NjNhZTEyLi5lOWM0ZTI0YzA5MGNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKWyAuLi4gXQo+IEBAIC0yMDUzLDcgKzIwNDcsNyBAQCBz
dGF0aWMgdm9pZCBoZG1pX2F2X2NvbXBvc2VyKHN0cnVjdCBkd19oZG1pICpoZG1pLAo+ICAJCUhE
TUlfRkNfSU5WSURDT05GX0lOX0lfUF9JTlRFUkxBQ0VEIDoKPiAgCQlIRE1JX0ZDX0lOVklEQ09O
Rl9JTl9JX1BfUFJPR1JFU1NJVkU7Cj4gIAo+IC0JaW52X3ZhbCB8PSBoZG1pLT5zaW5rX2lzX2hk
bWkgPwo+ICsJaW52X3ZhbCB8PSBkaXNwbGF5LT5pc19oZG1pID8KCklzIGl0IHNhZmUgdG8gcmVh
ZCBjb25uZWN0b3ItPmRpc3BsYXlfaW5mbyBkaXJlY3RseSBpbiB0aGUgYXRvbWljX2VuYWJsZSBw
YXRoPwoKU2luY2UgZHdfaGRtaV9wb3dlcm9uKCkgYW5kIGhkbWlfYXZfY29tcG9zZXIoKSBhcmUg
Y2FsbGVkIGZyb20gdGhlIGJyaWRnZSdzCmF0b21pY19lbmFibGUgY2FsbGJhY2ssIHRoZXkgY2Fu
IHJ1biBhc3luY2hyb25vdXNseSBmb3Igbm9uLWJsb2NraW5nIGNvbW1pdHMKYWZ0ZXIgdGhlIERS
TSBtb2Rlc2V0IGxvY2tzIGhhdmUgYmVlbiByZWxlYXNlZC4KCklmIGEgY29uY3VycmVudCBFRElE
IHByb2JlIHRyaWdnZXJlZCBieSB1c2Vyc3BhY2UgKGUuZy4sIHZpYQpEUk1fSU9DVExfTU9ERV9H
RVRDT05ORUNUT1IpIGNhbGxzIGRybV9lZGlkX2Nvbm5lY3Rvcl91cGRhdGUoKSBvbiBhbm90aGVy
IENQVSwKaXQgc3RhcnRzIGJ5IGNhbGxpbmcgZHJtX3Jlc2V0X2Rpc3BsYXlfaW5mbygpIHdoaWNo
IGNsZWFycyBkaXNwbGF5X2luZm8uaXNfaGRtaQphbmQgaGFzX2F1ZGlvIHRvIGZhbHNlIHVudGls
IHRoZSBFRElEIGlzIGZ1bGx5IHJlLXBhcnNlZC4KCklmIHRoaXMgY29kZSByZWFkcyB0aGUgZGlz
cGxheV9pbmZvIGZpZWxkcyBkdXJpbmcgdGhhdCB3aW5kb3csIHdvbid0IGl0IG9ic2VydmUKdHJh
bnNpZW50IHplcm9lcyBhbmQgaW5jb3JyZWN0bHkgcHJvZ3JhbSB0aGUgaGFyZHdhcmUgZm9yIERW
SSBtb2RlLCBhcyB3ZWxsIGFzCmRpc2FibGluZyBTQ0RDIHNjcmFtYmxpbmcgYW5kIGF1ZGlvPwoK
V291bGQgaXQgYmUgYmV0dGVyIHRvIGNhcHR1cmUgdGhlc2UgcHJvcGVydGllcyBpbnRvIGFuIGF0
b21pYyBzdGF0ZSBzdHJ1Y3R1cmUKZHVyaW5nIGF0b21pY19jaGVjaygpIGFuZCByZWFkIHRoZW0g
c2FmZWx5IGZyb20gdGhlIHN0YXRlIG9iamVjdCBkdXJpbmcKYXRvbWljX2VuYWJsZSgpPwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MDUxNjE4MzgzOC4yMDI0OTkxLTEtam9uYXNAa3dpYm9vLnNlP3BhcnQ9MTYKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
