Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C71CC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC27218FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:42:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JHm1LGVw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ii2n3G+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC27218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7/8VLTvHBUqC4sehdP4FBl4pK2JAxTDM1jy2aIFYd8=; b=JHm1LGVwV7277V
	bhD0selrhBxFuBdSnsqWLbTKc95iCWM/OY5Q3lxGqHBYAnCurMDNfhFNhtN3Urb83oLIXupAuHZU+
	jvT9gOiVNoPOk343cGalfEz5cuUF/kZJMnYDGQ9RlKeVad/qI20NKFsUJ3plimrq5zFnzsl1SyF5X
	l79/SOW3Me9vhybK+ZRLmZt7twh40YCMp0FSDJoH8Zd9E9xiX7UQjdbR9NiTMnq7nucNO8iYnOm3U
	pittglCTFGh3PCRfVwLK9uBHPKHYeZLiaQesJatvvjVXh6fn+4qWP1+OB99pNhy/QcQKqAscLJiDA
	lRqJvDLUBSHmSn08jlhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AVf-0002Pf-6S; Sat, 16 Mar 2019 14:42:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AVc-0002P0-VI
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:42:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so6500403wrp.2
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=WzUIHQxCNMlTcr2lcRulVSigdhGj2YLRtdawsHFTcCI=;
 b=ii2n3G+4PZ7Vl2XnPhHc7ZpUyAC+6b/ORlw6ipUGXinOBebxSLu4xwMl4MQCYwngcK
 LWVhJg8z8U7/JwFpDHfawWEMlcHepqneuYmvY2u2uHi2FpD5rJRaBXm34/rCZayarwT9
 ANN3b1peQxhzQk0nZI+BljWKHUrY4OVeddn/eXzO6tkPd4CiMJYlNhiferZ+B2i6dHlt
 +pLOxArXXF2c5/8koQtDf+snTMNghIYzN9MKR3NRUEG2IJTGO/9BU3FGnYaRA2zQy9ZX
 ju1Mg0Q3GuI3KgXgFe9fNsXg5TtncTgLGJkID2VRWUrprbVmUHnozb/W1JGXkCOl5JUp
 shSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=WzUIHQxCNMlTcr2lcRulVSigdhGj2YLRtdawsHFTcCI=;
 b=tXSZtv2/sb1fht+HiCFiJF3hVfo3mNfIkZviZNVNAPxbOVCWHTzot9iG+gX9O3KOup
 PCBa/mj6kh0hubM3OQ2U0e4L8UQz2nrpNczkpw2ILKJaDDyj6OL4Ry2ze4i4oRPsYToo
 cliq9unL0foX6HjAPnppXtzKytWqF7lD8XTa5frRhW+utA5TyNyw8TcepENqKi6XixJJ
 wtX9/csOLOSFAuIbBtIhp2PASAHKYS0Aop+DNcTGvJDHiHQm99VYZ/XijDJgvXDKgUEA
 TDZVCQLC2XYkqLSgF1Da5Yngcp/2xfXuf6LJ+0yhA0APDzeVItm1v8DB9L72rBKVzuiM
 YFOQ==
X-Gm-Message-State: APjAAAW+/FX0Q3+KC+kcXT73p7vCU/1xw0hDgP/42dCbjFgiubUtYJe/
 NwBOuXcJ8n2SZFCQM+xDvVhx9Q==
X-Google-Smtp-Source: APXvYqw5fPmMuJtK2qtAhgGy38HgStocKMVEgmfcER/zf/cKTGGKHt1YbPoLZ11A3Fa1dWR0/rjY0g==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr2354381wrw.167.1552747319381; 
 Sat, 16 Mar 2019 07:41:59 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 s187sm6676833wms.7.2019.03.16.07.41.58
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:41:58 -0700 (PDT)
Message-ID: <5C8D0B35.9080704@baylibre.com>
Date: Sat, 16 Mar 2019 15:41:57 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH 06/11] arm64: dts: meson-g12a-x96-max: add regulators
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-7-narmstrong@baylibre.com>
 <CAFBinCBEeCAKuzOztT5wU1t9UvY=ocVVrdHB6PNG7pp+gXq1=A@mail.gmail.com>
In-Reply-To: <CAFBinCBEeCAKuzOztT5wU1t9UvY=ocVVrdHB6PNG7pp+gXq1=A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_074201_001494_6D7C69CE 
X-CRM114-Status: GOOD (  12.96  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNS8wMy8yMDE5IDIzOjA1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsIGFuZCBHdWlsbGF1bWUsCj4gCj4gT24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMTE6MDQg
QU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPj4KPj4g
RnJvbTogR3VpbGxhdW1lIExhIFJvcXVlIDxnbGFyb3F1ZUBiYXlsaWJyZS5jb20+Cj4+Cj4+IEFk
ZCBzeXN0ZW0gcmVndWxhdG9ycyBmb3IgdGhlIFg5NiBNYXggU2V0LVRvcC1Cb3guCj4gdGhlIGhp
bnQgZnJvbSB0aGUgIm1lc29uLWcxMmEtc2VpNTEwOiBhZGQgcmVndWxhdG9ycyIgcGF0Y2ggd291
bGQgYmUKPiBncmVhdCBoZXJlIGFzIHdlbGw6Cj4gICBTdGlsbCBtaXNzaW5nCj4gICAqIFZERF9F
RSAoMC44ViAtIFBXTSBjb250cm9sbGVkKQo+ICAgKiBWRERfQ1BVKFBXTSBjb250cm9sbGVkKQo+
ICAgKiBWRERRMV81Cj4gCj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBib2FyZCBhbHNvIGhh
cyBWRERRMV81IHRob3VnaCwgYnV0IFZERF9FRQo+IGFuZCBWRERfQ1BVIHNob3VsZCBiZSB2ZXJ5
IHNpbWlsYXIgKG9yIGV2ZW4gaWRlbnRpY2FsKQo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHdWls
bGF1bWUgTGEgUm9xdWUgPGdsYXJvcXVlQGJheWxpYnJlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiAtLS0KPj4gIC4uLi9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmEteDk2LW1heC5kdHMgICB8IDY1ICsrKysrKysrKysr
KysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS14OTYtbWF4LmR0
cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJhLXg5Ni1tYXguZHRzCj4+
IGluZGV4IDBlZGJkMDBiMzU4Zi4uMjFlNWRlNDg2MTNlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS14OTYtbWF4LmR0cwo+PiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYS14OTYtbWF4LmR0cwo+PiBAQCAtMjEs
NiArMjEsNzEgQEAKPj4gICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4+
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MCAweDAgMHg0MDAwMDAwMD47Cj4+ICAgICAg
ICAgfTsKPj4gKwo+PiArICAgICAgIGZsYXNoXzF2ODogcmVndWxhdG9yLWZsYXNoXzF2OCB7Cj4+
ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4+ICsgICAg
ICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJGTEFTSF8xVjgiOwo+PiArICAgICAgICAgICAg
ICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47Cj4+ICsgICAgICAgICAgICAg
ICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKPj4gKyAgICAgICAgICAgICAg
IHZpbi1zdXBwbHkgPSA8JnZjY18zdjM+Owo+PiArICAgICAgICAgICAgICAgcmVndWxhdG9yLWFs
d2F5cy1vbjsKPj4gKyAgICAgICB9Owo+PiArCj4+ICsgICAgICAgbWFpbl8xMnY6IHJlZ3VsYXRv
ci1tYWluXzEydiB7Cj4+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1m
aXhlZCI7Cj4+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICIxMlYiOwo+PiArICAg
ICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTIwMDAwMDA+Owo+PiArICAg
ICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTIwMDAwMDA+Owo+PiArICAg
ICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjsKPj4gKyAgICAgICB9Owo+IG1pbmUgaGFz
IGEgNVYgREMgaW4uIGNhbiB5b3UgcGxlYXNlIGNoZWNrIHRoaXMgb24geW91ciBib2FyZD8KCklu
ZGVlZCBpdCdzIGEgYmFkIGNvcHkvcGFzdGUgZnJvbSBTRUk1MTAKCj4gCj4gCj4gUmVnYXJkcwo+
IE1hcnRpbgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
