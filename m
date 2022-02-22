Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED4DC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIoRbIDTq0DdcJK4KNU//0YrfcnD/6hVEHNG/Sm6syM=; b=TZ0Ovx0RZgMtjj
	8BTjPIb52HzN9U9Byw9cQKDRMDdQqTCxny9iVxaQJWEVryFzI0vfC9MrOidYsSs7IaUN44RIHZ9Do
	cSZOk8+lk572ekT8hRB746ii45EDvVz/QkaqN3aXsADFvrgfwxMbVM9GePlYIzPyEdUJEFDgcpzs4
	ZPXiGJXD84Z6/gZcCZIkke5nQ9dERAup6h4jOP1fj/SlSfiQVnsqrbRhhwc64TWQWV+HGwN3TQfBd
	llVPCmZromTCU1NrwlosWKNmHSbLMlPE3P6VJe+mPH6xeWF2azXlCwpXfM/Pf81IFNGl/omb6AsJ/
	PVuF7PChT0VbNRfd3PNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMX8V-00AFPd-Aa; Tue, 22 Feb 2022 15:31:31 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMX8R-00AFNJ-0P; Tue, 22 Feb 2022 15:31:30 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E8E261F3A3;
 Tue, 22 Feb 2022 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645543884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDPR/RXvsCjUbyhuXvYy8h8gwyiPv74HOWucNF3wYxk=;
 b=lIS/6beohKMQq+8gS6SQYcDHOi/ruXQaNMzRNoW3jHVhGZc+JZqJvuFFu6bq/4qAuJtIPC
 h47tif6zGyKNdSGDQNdmvctntW3su9UxqbflWCLMN4A4mGO/UYmiMfB+FDz2Z5CVx1EHo2
 MQ37RTB+gL/CONYWVUhtMkZuqMrIbjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645543884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDPR/RXvsCjUbyhuXvYy8h8gwyiPv74HOWucNF3wYxk=;
 b=ugoYPahRmWnja57J9+RNhmgpFpPRC15aLeQzJRi79k+bbxIb7tI2exn4EmcoUmH1SHy3FV
 5e2o0hwpoQcXzCAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C03D13BC3;
 Tue, 22 Feb 2022 15:31:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sLXXH8wBFWLrJAAAMHmgww
 (envelope-from <afaerber@suse.de>); Tue, 22 Feb 2022 15:31:24 +0000
Message-ID: <587391d0-f364-b2b6-399d-8994f4a17385@suse.de>
Date: Tue, 22 Feb 2022 16:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
 <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
 <862fc0e3-6c76-8dea-6725-a6c45ade1ecd@suse.de>
 <09bf3d8a-2902-723b-80d2-0c4d1c24f53d@gmail.com>
 <a890337b-39e4-f796-2d53-05edd2d69c80@suse.de>
 <1530c337-22b5-b20d-27ae-50696344e80f@baylibre.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
In-Reply-To: <1530c337-22b5-b20d-27ae-50696344e80f@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_073127_220376_72934478 
X-CRM114-Status: GOOD (  12.56  )
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

T24gMjIuMDIuMjIgMTU6NDgsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IE9uIDIyLzAyLzIwMjIg
MTM6MTIsIEFuZHJlYXMgRsOkcmJlciB3cm90ZToKPj4gT24gMTkuMDIuMjIgMTg6MTYsIEhlaW5l
ciBLYWxsd2VpdCB3cm90ZToKPj4+IE9uIDE5LjAyLjIwMjIgMTc6MDcsIEFuZHJlYXMgRsOkcmJl
ciB3cm90ZToKPj4+PiBbLi4uXSAoQW5kIG1vc3QgUmVhbHRlayBwbGF0Zm9ybXMgZ290Cj4+Pj4g
YnJva2VuIGJ5IHJlbW92aW5nIHRoZSBhZGp1c3RhYmxlIHRleHQgYmFzZSBkZWZpbmVzLikKPj4+
Pgo+Pj4gSSdtIG5vdCBhd2FyZSBvZiB0aGUgUmVhbHRlayBwbGF0Zm9ybSBpc3N1ZSwgZG8geW91
IGhhdmUgYSBsaW5rIHRvIGEKPj4+IHJlbGF0ZWQgZGlzY3Vzc2lvbj8KPj4KPj4gUmVhbHRlayBo
YXMgYSBib290IFJPTSBhdCB0aGUgYmVnaW5uaW5nIG9mIG1lbW9yeSBzcGFjZSwgd2hpY2ggaGFz
IGJlZW4KPj4gYSBwcm9ibGVtIGZyb20gdGhlIGZpcnN0IFJGQyBhbmQgZm9yIG1vc3QgYm9vdGxv
YWRlcnMgcmVxdWlyZWQgdG8gdHdlYWsKPj4gdGhlIGtlcm5lbCdzIHRleHQgb2Zmc2V0IGZvciBz
dWNjZXNzZnVsIGJvb3QuIChTb21lIG5vdCBPcGVuIFNvdXJjZSAoTEspCj4+IGFuZC9vciBub3Qg
b3Blbmx5IGZsYXNoYWJsZS4pCj4+Cj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVy
bWFpbC9saW51eC1hcm0ta2VybmVsLzIwMTctRmVicnVhcnkvNDg3NzE4Lmh0bWwKPj4KPj4KPj4g
SW4gMjAyMCB0aGF0IGFybTY0IGZlYXR1cmUgZ290IHJlbW92ZWQgd2l0aG91dCBhbnkgZnVydGhl
ciBkaXNjdXNzaW9uOgo+Pgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMDA4MjUx
MzU0NDAuMTEyODgtMS1hcmRiQGtlcm5lbC5vcmcvCj4gCj4gTm90ZSB0aGUgVEVYVF9PRkZTRVQg
aXMgb25seSBhbiBpc3N1ZSB3aXRoIEFtbG9naWMgdmVuZG9yIGJvb3Rsb2FkZXIsCj4gaXQgaGFz
IG5ldmVyIGJlZW4gYW4gaXNzdWUgd2l0aCBtYWlubGluZSBVLUJvb3QuCgpUaGVyZSBpcyBubyBt
YWlubGluZSBVLUJvb3QgZm9yIFJlYWx0ZWsgREhDICghPSBBbWxvZ2ljIE1lc29uKSB0aG91Z2gh
CgpNb3JlIGltcG9ydGFudCBkcml2ZXJzIHRoYW4gTEVEIGdvdCBibG9ja2VkIGhlcmUsIHRvbywg
bGlrZSBNTUMgYW5kIFVTQgphbmQgcGluY3RybCBhbmQgY2xrLgoKQW5kIGFzIGhpbnRlZCBhYm92
ZSwgc29tZSBSZWFsdGVrIGJvYXJkcyBjb21lIHdpdGggYSB2ZW5kb3IgTEsgdGhhdCBJCmNhbid0
IGV2ZW4gcGF0Y2ggYSBkb3duc3RyZWFtIHZlcnNpb24gb2YuCgpSZWdhcmRzLApBbmRyZWFzCgot
LSAKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQpHRjogSXZvIFRvdGV2CkhSQiAzNjgwOSAoQUcgTsO8cm5i
ZXJnKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
