Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A872EC282D8
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 11:34:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739082080D
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 11:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZmQP8E3U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e2DeQ0WP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739082080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gg3n7cQ6RCvk2PQKs9vUPup40HdBbOR7vO2lvoIO7oY=; b=ZmQP8E3U8vWxCD
	XRQ2gOfVfdM1deU8YHoYWTF9VWzakgIkdiXBAJ/Aq7HP2ubXv7eQx03AUlqEYaBQRptOSHbN5qDok
	ItAM73ejHucY6O8wYw2Im7IC7bk94BswdHkT03n16qLGi/3jvTBBQ4KIEUThnY0SjYf/Lw8XwcE2W
	QRNhZANj32qVHQKLKt2DmiDSipahp2FPNcPMIhmFlJL9DL7QEn7MjPfCWQkCkyWPsRs46uviaVbfZ
	dvF4tUARMngR7XUu8vmEPKfhS2KVlXFCCeoHy6ySCZJ5oPZ3WaADNlaCJ3uVjRE5U4bUXUSv0At8+
	hCcSFLqytLvn96NYkkEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpX52-0002t5-51; Fri, 01 Feb 2019 11:33:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpX4y-0002si-F3
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 11:33:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id s12so6712996wrt.4
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=ZXYlc63H7De0rj7SJNfiljjCCHb3Fnm0LQrGE6/dy/8=;
 b=e2DeQ0WPK6Y3XGEaVgurOx36j3qPyB28xrm0q5FaAYBlQ3y8li/WOjVhWWroTKLvZV
 vWnoHtbqvwNSruP2zSTp8lQZ11KH1HWX4oUH8tOncY8VRBgqw3W+yrnYpbrSOCD7Zzda
 TBiLkNBfi/QKyR9mg6LBsuwZebJvEL486hVJ7dCSOBU2a0m+40aOIxMGwktHqhTaPkVc
 f1mTR2dDdEQlpe3uH+PSHTAXa6IDr91jcNlBYSspeDVjzzuzK6aVj1M2Gcj2VNChGJfs
 oce8IqgX7J4+8Ngo8gqe1SJmfsJ4V/2QXkjC5ZS/sVqizStL7uir6ErX8KwParDjA293
 4AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=ZXYlc63H7De0rj7SJNfiljjCCHb3Fnm0LQrGE6/dy/8=;
 b=N3oigCKN3aY7O/a2iUkpafzpsLwZSWhsE/ZqjazbEnsiTEwvY/LGfkCstU3S/C9mwg
 s3fK3OENyfSSg0riIgjmJJLTtv2PkF7is+9/PBBH7SqGmco6kKp3QTqpPBdNRktjufx1
 AdIiwUc80zf8wo5sZmDKGzTkvKhA/wmCSHJPCu5C1hUaLJ52zVdVLQw4Fci6C1qx+U8H
 57na8iDclrAyXNFF/oN/j+pN10GDD2nNLDfozkRsnX0oGZc9Y5alTD1P/5xwe62YgmDZ
 6LQUlGD6i1ApaqaztvvLPMUWWGmnLSFBJuwh74aiy72BZL+6KHphzWqKBp1X6UtW6lra
 x3IQ==
X-Gm-Message-State: AJcUukexlNZZb2uGKbAshivIwx4Q6YjNvuoeBLg2BYcdA52aqngFWh5Y
 hM3LBMFYI5a8iSoIenggZkfUhQ==
X-Google-Smtp-Source: ALg8bN4Dmm9f/fICAS1iGn7PkjOV1zjh5BWr2fAplYgjZSc1nGfUVHRKgmjloL2XPoKCik01rSe3lg==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr38773824wrc.191.1549020829579; 
 Fri, 01 Feb 2019 03:33:49 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id x3sm10712897wrd.19.2019.02.01.03.33.48
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 03:33:48 -0800 (PST)
Message-ID: <5C542E9B.4020408@baylibre.com>
Date: Fri, 01 Feb 2019 12:33:47 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?=
 <heiko@sntech.de>, maxime.ripard@bootlin.com
Subject: Re: [PATCH 0/8] drm/meson: Add support for HDMI2.0 4k60
References: <20190115123315.11069-1-narmstrong@baylibre.com>	<CGME20190131132546epcas5p264ec54cb60053b409f0459f809825eef@epcas5p2.samsung.com>	<a3de23a8-3fa4-f8c5-5b2a-33109c09a863@baylibre.com>	<0fa602d6-a57e-0248-fcfd-929e3d9ceab1@samsung.com>	<3f28a247-f6d3-be03-ca9f-15dfee1939c2@baylibre.com>
 <9ba7a251-103e-0cfd-f77e-e78cc1e56ad8@samsung.com>
In-Reply-To: <9ba7a251-103e-0cfd-f77e-e78cc1e56ad8@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_033352_553958_CBCBA66E 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAwMS8wMi8yMDE5IDExOjI1LCBBbmRyemVqIEhhamRhIGEgw6ljcml0IDoKPiBPbiAzMS4w
MS4yMDE5IDE2OjUwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gT24gMzEvMDEvMjAxOSAxNTox
MywgQW5kcnplaiBIYWpkYSB3cm90ZToKPj4+IE9uIDMxLjAxLjIwMTkgMTQ6MjUsIE5laWwgQXJt
c3Ryb25nIHdyb3RlOgo+Pj4+IEhpIEFuZHJ6ZWosIExhdXJlbnQsCj4+Pj4KPj4+PiBPbiAxNS8w
MS8yMDE5IDEzOjMzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+Pj4gVGhpcyBwYXRjaHNldCBh
aW1zIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgZm9sbG93aW5nIEhETUkyLjAgNGs2MCBtb2RlczoK
Pj4+Pj4gLSA1OTRNaHogVE1EUyBmcmVxdWVuY3kgbmVlZGluZyBUTURTIFNjcmFtbGluZyBhbmQg
MS80MCByYXRlIGZvciBSR0IvWVVWNDo0OjQKPj4+Pj4gLSAyOTdNSHogVE1EUyBmcmVxdWVuY3kg
d2l0aCBZVVY0OjI6MCBlbmNvZGluZwo+Pj4+Pgo+Pj4+PiBUaGUgZmlyc3QgbW9kZSB1c2VzIHRo
ZSBTQ0RDIGhlbHBlcnMgaW50cm9kdWNlZCBieSBpbnRlbCB0byA6Cj4+Pj4+IC0gZGlzY292ZXIg
d2hlcmUgdGhlIG1vbml0b3Igc3VwcG9ydCBTQ0RDCj4+Pj4+IC0gc2V0dXAgdGhlIFNDREMgcGFy
YW1ldGVycwo+Pj4+PiBUaGlzIGlzIGltcGxlbWVudGVkIGluIHRoZSBkdy1oZG1pIGJyaWRnZSBk
cml2ZXIgYnkgaGFuZGxpbmcgc2NyYW1ibGluZwo+Pj4+PiBzdXBwb3J0IGR1cmluZyB0aGUgYnJp
ZGdlIHNldHVwIGFuZCBieSBleHBvcnRpbmcgYW4gaGVscGVyIGZvciB0aGUgUEhZCj4+Pj4+IHNl
dHVwIHRvIHNldHVwIHRoZSBTQ0RDIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSAxLzQwIFRNRFMgcmF0
ZS4KPj4+Pj4gVGhpcyBjb2RlIHdpbGwgb25seSBiZSBhY3RpdmUgaWYgdGhlIGVuY29kZXIgc3Vw
cG9ydCBhIFRNRFMgcmF0ZSA+IDM0ME1Iei4KPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCBjb3VsZCBl
dmVudHVhbGx5IGJyZWFrIHN1cHBvcnQgb24gZGlmZmVyZW50IFNvQyB3aGVuIGNvbm5lY3RlZAo+
Pj4+PiBvbiBhIDRrNjAgbW9uaXRvciB3aXRoIFNDREMgOgo+Pj4+PiAtIGkuTVggY29ycmVjdGx5
IGRpc2NhcmRzIHBpeGVsIGNsb2NrcyA+IDIxNk1Iego+Pj4+PiAtIFItQ0FSIGRpc2NhcmRzIGRp
c2NhcmRzIHBpeGVsIGNsb2NrcyA+IDI5N01IeiBzaW5jZSBbMV0KPj4+Pj4gLSBSb2NrY2hpcCBk
aXNjYXJkcyBpbnZhbGlkIHBpeGVsIGNsb2NrcyBub3QgaW4gdGhlIHJvY2tjaGlwX21wbGxfY2Zn
IHRhYmxlCj4+Pj4+IC0gc3VuOGkgY29ycmVjdGx5IGRpc2NhcmRzIHBpeGVsIGNsb2NrcyA+IDI5
N01IeiBvbiBhODN0Cj4+Pj4+IC0gc3VuOGkgZGlzY2FyZHMgZGlzY2FyZHMgcGl4ZWwgY2xvY2tz
ID4gNTk0TWh6IG9uIGg2LCB3aGljaCBpcyBhbHJlYWR5IGJyb2tlbgo+Pj4+Pgo+Pj4+PiBGaXJz
dCBwYXRjaCBzaG91bGQgZml4IHN1cHBvcnQgZm9yIEFsbHdpbm5lciBINi4KPj4+Pj4KPj4+Pj4g
VGhlIHNlY29uZCBtb2RlIGlzIGltcGxlbWVudGVkIGJ5IGFkZGVkIHRoZSBtaXNzaW5nIDQ6Mjow
IGJ5cGFzcyBoYW5kbGluZwo+Pj4+PiBpbiB0aGUgZHctaGRtaSBicmlkZ2UgZHJpdmVyIGFuZCBh
ZGRpbmcgYSAibXRtZHNjbG9jayIgc2VwYXJhdGluZyB0aGUKPj4+Pj4gcGl4ZWwgY2xvY2sgZnJv
bSB0aGUgdG1kcyBjbG9jayBpbiB0aGUgbW9kZSBzZXR1cCBwaGFzZS4KPj4+Pj4gV2UgYWxzbyBl
bmFibGUgc3VwcG9ydCBmb3IgdGhlc2UgbW9kZXMgaW4gdGhlIGNvbm5lY3RvciBvbmx5IGlmIHRo
ZSBwbGF0Zm9ybQo+Pj4+PiBnbHVlIGNvZGUgZXhwbGljaXRzIHRoZSBzdXBwb3J0Lgo+Pj4+IERv
IHlvdSB0aGluayBwYXRjaGVzIDEtNCBjb3VsZCBiZSBhcHBsaWVkID8KPj4+Cj4+PiBGb3IgbWUg
dGhleSBhcmUgT0suCj4+Pgo+Pj4gU2hvdWxkIEkgdGFrZSB0aGVtIHZpYSBkcm0tbWlzYz8KPj4g
T0sgZm9yIG1lICEKPj4KPj4gTmVpbAo+IAo+IAo+IFRoZXNlIHBhdGNoZXMgZG8gbm90IGFwcGx5
LiBDb3VsZCB5b3UgcmViYXNlIHRoZW0gb24gZHJtLW1pc2MtbmV4dC4KClN1cmUsIHJlLXNwaW5u
aW5nLgoKTmVpbAoKPiAKPiAKPiBSZWdhcmRzCj4gCj4gQW5kcnplago+IAo+IAo+IAo+Pgo+Pj4K
Pj4+PiBUaGVuIHdlIGNvdWxkIGZvY3VzIG9uIGhvdyB3ZSBtYW5hZ2UgdGhlIGJ1cyBmb3JtYXQg
YmV0d2VlbiB0aGUgZW5jb2Rlcgo+Pj4+IGFuZCB0aGUgYnJpZGdlID8KPj4+Pgo+Pj4+IEVzcGVj
aWFsbHkgcGF0Y2ggNSBsaW5rZWQgdG8gcGF0Y2ggNy4KPj4+Pgo+Pj4+IFdpbGwgb25lIG9mIHlv
dSBiZSBhdCBGT1NERU0gMjAxOSA/IHdlIGNvdWxkIGNoYXQgYWJvdXQgdGhpcy4KPj4+Cj4+PiBO
b3BlLgo+Pj4KPj4+Cj4+PiBSZWdhcmRzCj4+Pgo+Pj4gQW5kcnplago+Pj4KPj4+Cj4+Pj4gRm9s
bG93aW5nIHN1YmplY3RzIG9uIHRoZSB0YWJsZSB3aWxsIGJlIDoKPj4+PiAtIEhEUiBtZXRhZGF0
YSB0cmFuc21pc3Npb24gYWxpZ25lZCB3aXRoIHRoZSBsYXN0IHBhdGNoc2V0IHNlbnQgYnkgaW50
ZWwtZ2Z4Cj4+Pj4gLSBDb2xvcnNwYWNlIGNvbm5lY3RvciBwcm9wZXJ0eSBhbGlnbmVkIHdpdGgg
dGhlIGxhc3QgcGF0Y2hzZXQgc2VudCBieSBpbnRlbC1nZngKPj4+PiAtIEhEQ1AgMS40IGFuZCAy
LjIgaGFuZGxpbmcKPj4+Pgo+Pj4+IE5laWwKPj4+Pgo+Pj4+PiBPbmx5IHRoZSBtZXNvbiBEUk0g
ZHdfaGRtaSBnbHVlIGFsbG93cyB5Y2JjcjQyMCBtb2Rlcywgc28gbm8gYnJlYWthZ2UKPj4+Pj4g
aXMgZXhwZWN0ZWQgaGVyZS4KPj4+Pj4KPj4+Pj4gVGhlIHJlbWFpbmluZyBwYXRjaGVzIGFkZHMg
c3VwcG9ydCBmb3IgOgo+Pj4+PiAtIDEvNDAgVE1EUyByYXRlIGFrYSBESVY0MCBpbiB0aGUgZHct
aGRtaSBtZXNvbiBQSFkgc2V0dXAKPj4+Pj4gLSA0OjI6MCBvdXRwdXQgYW5kIGNsb2NrIHNldHVw
Cj4+Pj4+Cj4+Pj4+IFRoZSBkdy1oZG1pIHN1cHBvcnQgcmUtdXNlcyB0aGUgc3VwcG9ydCBkb25l
IGJ5IFJvY2tjaGlwIGVuZ2luZWVycyBvbiB0aGUKPj4+Pj4gTGludXggNC40IEJTUCBrZXJuZWwu
Cj4+Pj4+Cj4+Pj4+IFRoZXNlIG1vZGVzIGhhcyBiZWVuIHZhbGlkYXRlZCB1c2luZyBhIE11eExh
YiBIRE1JIFNpZ25hbCBBbmFseXNlciBpbgo+Pj4+PiBhZGRpdGlvbiB0byBkaWZmZXJlbnQgVUhE
IFRWcyBzdXBwb3J0aW5nIGZ1bGwgNGs2MCBvciB0aGUgNDoyOjAgdmFyaWFudC4KPj4+Pj4KPj4+
Pj4gQ2hhbmdlcyBzaW5jZSBSRkMgdjIgYXQgWzNdOgo+Pj4+PiAtIENvbGxlY3RlZCB0ZXN0ZWQt
YnkgYW5kIHJldmlld2VkLWJ5IHRhZ3MKPj4+Pj4gLSBDaGFuZ2VkIGlmIGNvbmRpdGlvbiBpbiAi
YWRkIEhETUkgZGl2NDAgVE1EUyBtb2RlIgo+Pj4+PiAtIFVwZGF0ZWQgIkFkZCBZVVY0MjAgb3V0
cHV0IHN1cHBvcnQiIHdpdGggdGhlIHNhbWUgaWYgY29uZGl0aW9uCj4+Pj4+Cj4+Pj4+IENoYW5n
ZXMgc2luY2UgUkZDIHYxIGF0IFsyXToKPj4+Pj4gLSBGaXggYWxsIGNvbW1lbnRzIGZyb20gTGF1
cmVudCA6Cj4+Pj4+IC0gQWRkIGRlZmluZSBmb3IgSERNSSAxLjQgbWF4IHRtZHMgY2xvY2sgYW5k
IFNDREMgc3VwcG9ydGVkIHZlcnNpb24KPj4+Pj4gLSBDYWxsIGR3X2hkbWlfc2V0X2hpZ2hfdG1k
c19jbG9ja19yYXRpbygpIGluIGR3X2hkbWlfcGh5X2VuYWJsZV9wb3dlcmRvd24oKQo+Pj4+PiB0
byB1bmJyZWFrIEFsbHdpbm5lciBINgo+Pj4+PiAtIFBhc3MgaW5fdCh1OCwgYnl0ZXMsIFNDRENf
TUlOX1NPVVJDRV9WRVJTSU9OKSBhcyBTQ0RDIHZlcnNpb24KPj4+Pj4gLSBGaW5hbGx5IGFkZCBj
b21tZW50cyBmb3IgU0NEQyBhbmQgU2NyYW1ibGluZyBwcm9jZXNzCj4+Pj4+Cj4+Pj4+IFsxXSBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjYzNjE2Lwo+Pj4+PiBbMl0g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81Mjk1MC8jcmV2MQo+Pj4+
PiBbM10gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy81Mjk1MC8jcmV2
Mgo+Pj4+Pgo+Pj4+PiBOZWlsIEFybXN0cm9uZyAoNyk6Cj4+Pj4+ICAgZHJtL2JyaWRnZTogZHct
aGRtaTogQWRkIFNDREMgYW5kIFRNRFMgU2NyYW1ibGluZyBzdXBwb3J0Cj4+Pj4+ICAgZHJtL21l
c29uOiBhZGQgSERNSSBkaXY0MCBUTURTIG1vZGUKPj4+Pj4gICBkcm0vbWVzb246IGFkZCBzdXBw
b3J0IGZvciBIRE1JMi4wIDIxNjBwIG1vZGVzCj4+Pj4+ICAgZHJtL2JyaWRnZTogZHctaGRtaTog
YWRkIHN1cHBvcnQgZm9yIFlVVjQyMCBvdXRwdXQKPj4+Pj4gICBkcm0vYnJpZGdlOiBkdy1oZG1p
OiBhbGxvdyB5Y2JjcjQyMCBtb2RlcyBmb3IgPj0gMHgyMDBhCj4+Pj4+ICAgZHJtL21lc29uOiBB
ZGQgWVVWNDIwIG91dHB1dCBzdXBwb3J0Cj4+Pj4+ICAgZHJtL21lc29uOiBPdXRwdXQgaW4gWVVW
NDQ0IGlmIHNpbmsgc3VwcG9ydHMgaXQKPj4+Pj4KPj4+Pj4gWmhlbmcgWWFuZyAoMSk6Cj4+Pj4+
ICAgZHJtL2JyaWRnZTogZHctaGRtaTogc3VwcG9ydCBkeW5hbWljYWxseSBnZXQgaW5wdXQvb3V0
IGNvbG9yIGluZm8KPj4+Pj4KPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS5jIHwgMTgyICsrKysrKysrKysrKysrKysrKystLS0KPj4+Pj4gIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oIHwgICAxICsKPj4+Pj4gIGRyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgIHwgMTI4ICsrKysrKysrKysrKy0tLQo+Pj4+
PiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyAgICAgICAgfCAgOTMgKysrKysr
KystLS0KPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmggICAgICAgIHwg
ICA3ICstCj4+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jICAgICAgICB8
ICAgOCArLQo+Pj4+PiAgZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaCAgICAgICAg
fCAgMTEgKysKPj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYyAg
IHwgICAzICstCj4+Pj4+ICBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAg
ICB8ICAgNyArCj4+Pj4+ICA5IGZpbGVzIGNoYW5nZWQsIDM3NCBpbnNlcnRpb25zKCspLCA2NiBk
ZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4+Pgo+Pgo+Pgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
