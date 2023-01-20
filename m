Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA26C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVelJYiRCrHdHXsRIgz/pwoXvHmpa3A/Q5gS3aGmGrA=; b=AKhOM4izD8pzYU
	0agKOW9DQRFej2IqyW4++dddj2dM5+0MgOYY+m3jM3pfv/MPon8yDzFQGSksVLps6Wm1MH/VZBSZq
	LKr7g81VC/NQ+HKJQwgmkwdvGmy005TbOkoR9BpojEO+bh9QTy9higHeVXOkoUN2GepLQIkXnU5Qw
	BTnhxHJk4kZ77uDzfJCP+jvqUH+hgfiW32MB/kAx84ROWl7x+0YVtWasH3XCcWVo65wK3gcn89WXo
	niH4yMIHOgyUZxUjQw0v0+m1+FKGPaa4VqEyD+lMxjOW2kAA3Y755y6izHNNoId3+Gz93zeEN7BhL
	0pGeQN0J06C9MYrJIzzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIquQ-00ALJR-RJ; Fri, 20 Jan 2023 12:54:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIquL-00ALGP-Cm
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 12:54:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so3614208wms.2
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOX+k3UuKq4AwEVoTFGeP49p2J4horE9GcjRB3TErg8=;
        b=6mIwiuDEhMKmaNtOb1sJLQNd77+rqnoRCSVB5MRztejuX+Hlf3vFLBP5P464PdpeDa
         7nItUP0m9bE4UXvOZH/ziTt1JB+SsxYnbUJ1XuwTpkRlt3TK73LYzRqPkNJkYxRMQ8s9
         p0rrkC4mB/3xgLCUU6LOiNJzZeccwrhVE1Wm/hmE8sSBR0IJtVgdjXOagO6og8Ybhbad
         OVMDgRhWw8C5jd91zHBcp7XrlwQ062aUOcCRiFJU+II26iy1iZEutECvI8suKYp+gd/h
         vBkIE+OEn/qGVvlFTiUA0n2aadIT1C3jNE0ORmn1ZD05nZ+puLU342b4s/29rkxgxCOd
         OssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jOX+k3UuKq4AwEVoTFGeP49p2J4horE9GcjRB3TErg8=;
        b=w35MDyq8qFb9vjN4Z7b42z7m5topR5fZ8VE2sbClKnawKggM7pGZNQzZytpCCZuWDw
         ZgDaTevlFkAlPCHLSqbnvZyy88UX9a9OJO3s+mv5puj+C7L8McBiewy80kCOVIMZUqsi
         we2qJz+7b6H1o2ONyzWodgndyqB8G1p/gN62SGHRPQ2rcECv1B/PQ+Se+nwXjxKpO8Ad
         nCRJLt8YG8sPs1UMkS2CghBtBrZrnxXoFiWYNLGSpTU168lFwLgKHVHXFCCGkUvCCSFe
         d3Co/8X2gIbZLeqIS+uZfSNATV0cdu82Shk313k5BNFVfNmtDZBAeOIMa3JeaGtgOmAa
         5E8w==
X-Gm-Message-State: AFqh2kq/TabZWgf2R3+iD4/rHa7yuU1Eu7whL/69RkKpvfgKjefqcpCW
	Vsg6kKeJ5FdO42gigcSDUyQ3zQ==
X-Google-Smtp-Source: AMrXdXvxXHogpg2Chy4fm7mIBnCZs2OhxGPuTCu/oTa1HEP5vR8dZYsav6bFPBxnvI8nFU7v2WOFEw==
X-Received: by 2002:a05:600c:982:b0:3da:f5b5:13ec with SMTP id w2-20020a05600c098200b003daf5b513ecmr13434229wmp.34.1674219233935;
        Fri, 20 Jan 2023 04:53:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm2415952wmq.44.2023.01.20.04.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 04:53:53 -0800 (PST)
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
 <Y8Qwk5H8Yd7qiN0j@lunn.ch>
 <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
 <e75ed56f-ba25-f337-e879-33cc2a784740@gmail.com>
 <1jo7qtwm1z.fsf@starbuckisacylon.baylibre.com>
 <eef8668d-a1f1-7b5d-1a15-ebf3a00d1e4b@gmail.com>
 <dc1ab1b9-347e-5d6f-670b-03057a98d2dd@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, David Miller
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kevin Hilman
 <khilman@baylibre.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more
 G12A-internal PHY versions
Date: Fri, 20 Jan 2023 13:48:31 +0100
In-reply-to: <dc1ab1b9-347e-5d6f-670b-03057a98d2dd@gmail.com>
Message-ID: <1j4jslwen5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_045413_499214_BC549917 
X-CRM114-Status: GOOD (  38.72  )
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

Ck9uIEZyaSAyMCBKYW4gMjAyMyBhdCAxMTo1MiwgSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQx
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIDIwLjAxLjIwMjMgMTE6MjIsIEhlaW5lciBLYWxsd2Vp
dCB3cm90ZToKPj4gT24gMjAuMDEuMjAyMyAxMTowMSwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4+
Cj4+PiBPbiBUaHUgMTkgSmFuIDIwMjMgYXQgMjM6NDIsIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+PiBPbiAxNS4wMS4yMDIzIDIxOjM4LCBIZWlu
ZXIgS2FsbHdlaXQgd3JvdGU6Cj4+Pj4+IE9uIDE1LjAxLjIwMjMgMTk6NDMsIE5laWwgQXJtc3Ry
b25nIHdyb3RlOgo+Pj4+Pj4gSGkgSGVpbmVyLAo+Pj4+Pj4KPj4+Pj4+IExlIDE1LzAxLzIwMjMg
w6AgMTg6MDksIEhlaW5lciBLYWxsd2VpdCBhIMOpY3JpdMKgOgo+Pj4+Pj4+IE9uIDE1LjAxLjIw
MjMgMTc6NTcsIEFuZHJldyBMdW5uIHdyb3RlOgo+Pj4+Pj4+PiBPbiBTdW4sIEphbiAxNSwgMjAy
MyBhdCAwNDoxOTozN1BNICswMTAwLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+Pj4+Pj4+PiBP
biBteSBTQzItYmFzZWQgc3lzdGVtIHRoZSBnZW5waHkgZHJpdmVyIHdhcyB1c2VkIGJlY2F1c2Ug
dGhlIFBIWQo+Pj4+Pj4+Pj4gaWRlbnRpZmllcyBhcyAweDAxODAzMzAwLiBJdCB3b3JrcyBub3Jt
YWwgd2l0aCB0aGUgbWVzb24gZzEyYQo+Pj4+Pj4+Pj4gZHJpdmVyIGFmdGVyIHRoaXMgY2hhbmdl
Lgo+Pj4+Pj4+Pj4gU3dpdGNoIHRvIFBIWV9JRF9NQVRDSF9NT0RFTCB0byBjb3ZlciB0aGUgZGlm
ZmVyZW50IHN1Yi12ZXJzaW9ucy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSGkgSGVpbmVyCj4+Pj4+Pj4+
Cj4+Pj4+Pj4+IEFyZSB0aGVyZSBhbnkgZGF0YXNoZWV0cyBmb3IgdGhlc2UgZGV2aWNlcz8gQW55
dGhpbmcgd2hpY2ggZG9jdW1lbnRzCj4+Pj4+Pj4+IHRoZSBsb3dlciBuaWJibGUgcmVhbGx5IGlz
IGEgcmV2aXNpb24/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEknbSBqdXN0IHRyeWluZyB0byBhdm9pZCBm
dXR1cmUgcHJvYmxlbXMgd2hlcmUgd2UgZmluZCBpdCBpcyBhY3R1YWxseQo+Pj4+Pj4+PiBhIGRp
ZmZlcmVudCBQSFksIG5lZWRzIGl0cyBvd24gTUFUQ0hfRVhBQ1QgZW50cnksIGFuZCB0aGVuIHdl
IGZpbmQgd2UKPj4+Pj4+Pj4gYnJlYWsgZGV2aWNlcyB1c2luZyAweDAxODAzMzAyIHdoaWNoIHdl
IGhhZCBubyBpZGVhIGV4aXN0cywgYnV0IGdvdAo+Pj4+Pj4+PiBjb3ZlcmVkIGJ5IHRoaXMgY2hh
bmdlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBTQzIgcGxhdGZvcm0gaW5oZXJpdGVkIGEgbG90IGZy
b20gRzEyQSwgdGhlcmVmb3JlIGl0J3MgcGxhdXNpYmxlCj4+Pj4+Pj4gdGhhdCBpdCdzIHRoZSBz
YW1lIFBIWS4gQWxzbyB0aGUgdmVuZG9yIGRyaXZlciBmb3IgU0MyIGdpdmVzIGEgaGludAo+Pj4+
Pj4+IGFzIGl0IGhhcyB0aGUgZm9sbG93aW5nIGNvbXBhdGlibGUgZm9yIHRoZSBQSFk6Cj4+Pj4+
Pj4KPj4+Pj4+PiBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAxODAuMzMwMSIsICJldGhl
cm5ldC1waHktaWVlZTgwMi4zLWMyMiI7Cj4+Pj4+Pj4KPj4+Pj4+PiBCdXQgeW91J3JlIHJpZ2h0
LCBJIGNhbid0IHNheSBmb3Igc3VyZSBhcyBJIGRvbid0IGhhdmUgdGhlIGRhdGFzaGVldHMuCj4+
Pj4+Pgo+Pj4+Pj4gT24gRzEyQSAoJiBHWEwpLCB0aGUgUEhZIElEIGlzIHNldCBpbiB0aGUgTURJ
TyBNVVggcmVnaXN0ZXJzLAo+Pj4+Pj4gcGxlYXNlIHNlZToKPj4+Pj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11
eC1tZXNvbi1nMTJhLmMjTDM2Cj4+Pj4+Pgo+Pj4+Pj4gU28geW91IHNob3VsZCBlaXRoZXIgYWRk
IHN1cHBvcnQgZm9yIHRoZSBQSFkgbXV4IGluIFNDMiBvciBjaGVjawo+Pj4+Pj4gd2hhdCBpcyBp
biB0aGUgRVRIX1BIWV9DTlRMMCByZWdpc3Rlci4KPj4+Pj4+Cj4+Pj4+IFRoYW5rcyBmb3IgdGhl
IGhpbnQuIEkganVzdCBjaGVja2VkIGFuZCByZWFkaW5nIGJhY2sgRVRIX1BIWV9DTlRMMCBhdCB0
aGUKPj4+Pj4gZW5kIG9mIGcxMmFfZW5hYmxlX2ludGVybmFsX21kaW8oKSBnaXZlcyBtZSB0aGUg
ZXhwZWN0ZWQgcmVzdWx0IG9mIDB4MzMwMTAxODAuCj4+Pj4+IEJ1dCBzdGlsbCB0aGUgUEhZIHJl
cG9ydHMgMzMwMC4KPj4+Pj4gRXZlbiBpZiBJIHdyaXRlIHNvbWUgb3RoZXIgcmFuZG9tIHZhbHVl
IHRvIEVUSF9QSFlfQ05UTDAsIEkgZ2V0IDAxODAvMzMwMAo+Pj4+PiBhcyBQSFkgSUQuCj4+Pj4+
Cj4+Pj4+IEZvciB1LWJvb3QgSSBmb3VuZCB0aGUgZm9sbG93aW5nOgo+Pj4+Pgo+Pj4+PiBodHRw
czovL2dpdGh1Yi5jb20va2hhZGFzL3UtYm9vdC9ibG9iL2toYWRhcy12aW00LXItNjRiaXQvZHJp
dmVycy9uZXQvcGh5L2FtbG9naWMuYwo+Pj4+Pgo+Pj4+PiBzdGF0aWMgc3RydWN0IHBoeV9kcml2
ZXIgYW1sb2dpY19pbnRlcm5hbF9kcml2ZXIgPSB7Cj4+Pj4+IAkubmFtZSA9ICJNZXNvbiBHWEwg
SW50ZXJuYWwgUEhZIiwKPj4+Pj4gCS51aWQgPSAweDAxODAzMzAwLAo+Pj4+PiAJLm1hc2sgPSAw
eGZmZmZmZmYwLAo+Pj4+PiAJLmZlYXR1cmVzID0gUEhZX0JBU0lDX0ZFQVRVUkVTLAo+Pj4+PiAJ
LmNvbmZpZyA9ICZtZXNvbl9waHlfY29uZmlnLAo+Pj4+PiAJLnN0YXJ0dXAgPSAmbWVzb25fYW1s
X3N0YXJ0dXAsCj4+Pj4+IAkuc2h1dGRvd24gPSAmZ2VucGh5X3NodXRkb3duLAo+Pj4+PiB9Owo+
Pj4+Pgo+Pj4+PiBTbyBpdCdzIHRoZSBzYW1lIFBIWSBJRCBJJ20gc2VlaW5nIGluIExpbnV4Lgo+
Pj4+Pgo+Pj4+PiBNeSBiZXN0IGd1ZXNzIGlzIHRoYXQgdGhlIGZvbGxvd2luZyBpcyB0aGUgY2Fz
ZToKPj4+Pj4KPj4+Pj4gVGhlIFBIWSBjb21wYXRpYmxlIHN0cmluZyBpbiBEVCBpcyB0aGUgZm9s
bG93aW5nIGluIGFsbCBjYXNlczoKPj4+Pj4gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQw
MTgwLjMzMDEiLCAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+Pj4+Pgo+Pj4+PiBUaGVy
ZWZvcmUgaWQgMDE4MC8zMzAxIGlzIHVzZWQgZXZlbiBpZiB0aGUgUEhZIHJlcG9ydHMgc29tZXRo
aW5nIGVsc2UuCj4+Pj4+IE1lYW5zIGl0IGRvZXNuJ3QgbWF0dGVyIHdoaWNoIHZhbHVlIHlvdSB3
cml0ZSB0byBFVEhfUEhZX0NOVEwwLgo+Pj4+Pgo+Pj4+PiBJIHJlZHVjZWQgdGhlIGNvbXBhdGli
bGUgc3RyaW5nIHRvIGNvbXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiCj4+
Pj4+IGFuZCB0aGlzIHJlc3VsdGVkIGluIHRoZSBhY3R1YWwgUEhZIElEIGJlaW5nIHVzZWQuCj4+
Pj4+IFlvdSBjb3VsZCBjaGFuZ2UgdGhlIGNvbXBhdGlibGUgaW4gZHRzIHRoZSBzYW1lIHdheSBm
b3IgYW55IGcxMmEgc3lzdGVtCj4+Pj4+IGFuZCBJIGFzc3VtZSB5b3Ugd291bGQgZ2V0IDAxODAv
MzMwMCB0b28uCj4+Pj4+Cj4+Pj4+IFJlbWFpbmluZyBxdWVzdGlvbiBpcyB3aHkgdGhlIHZhbHVl
IGluIEVUSF9QSFlfQ05UTDAgaXMgaWdub3JlZC4KPj4+Pj4KPj4+Pgo+Pj4+IEkgdGhpbmsgSSBm
b3VuZCB3aGF0J3MgZ29pbmcgb24uIFRoZSBQSFkgSUQgd3JpdHRlbiB0byBTb0MgcmVnaXN0ZXIK
Pj4+PiBFVEhfUEhZX0NOVEwwIGlzbid0IGVmZmVjdGl2ZSBpbW1lZGlhdGVseS4gSXQgdGFrZXMg
YSBQSFkgc29mdCByZXNldCBiZWZvcmUKPj4+PiBpdCByZXBvcnRzIHRoZSBuZXcgUEhZIElELiBX
b3VsZCBiZSBnb29kIHRvIGhhdmUgYSBjb21tZW50IGluIHRoZQo+Pj4+IGcxMmEgbWRpbyBtdXgg
Y29kZSBtZW50aW9uaW5nIHRoaXMgY29uc3RyYWludC4KPj4+Pgo+Pj4+IEkgc2VlIG5vIGVhc3kg
d2F5IHRvIHRyaWdnZXIgYSBzb2Z0IHJlc2V0IGVhcmx5IGVub3VnaC4gVGhlcmVmb3JlIGl0J3Mg
aW5kZWVkCj4+Pj4gdGhlIHNpbXBsZXN0IG9wdGlvbiB0byBzcGVjaWZ5IHRoZSBuZXcgUEhZIElE
IGluIHRoZSBjb21wYXRpYmxlLgo+Pj4KPj4+IFRoaXMgaXMgYmVjYXVzZSAoSSBndWVzcykgdGhl
IFBIWSBvbmx5IHBpY2tzIHVwcyB0aGUgSUQgZnJvbSB0aGUgZ2x1ZQo+Pj4gd2hlbiBpdCBwb3dl
cnMgdXAuIEFmdGVyIHRoYXQgdGhlIHZhbHVlcyBhcmUgaWdub3JlZC4KPj4+Cj4+IEkgdGVzdGVk
IGFuZCBhIFBIWSBzb2Z0IHJlc2V0IGlzIGFsc28gc3VmZmljaWVudCB0byBwaWNrIHVwIHRoZSBu
ZXcgUEhZIElELgo+PiBTdXBwb3NlZGx5IGV2ZXJ5dGhpbmcgZXhlY3V0aW5nIHRoZSBzb2Z0IHJl
c2V0IGxvZ2ljIGlzIHN1ZmZpY2llbnQ6Cj4+IHBvd2VyLXVwLCBzb2Z0IHJlc2V0LCBjb21pbmcg
b3V0IG9mIHN1c3BlbmQvcG93ZXItZG93bgo+PiAKPj4gCj4+PiBSZW1lbWJlciB0aGUgUEhZIGlz
IGEgImJvdWdodCIgSVAsIHRoZSBnbHVlL211eCBwcm92aWRlcyB0aGUgaW5wdXQKPj4+IHNldHRp
bmdzIHJlcXVpcmVkIGJ5IHRoZSBQSFkgcHJvdmlkZXIuCj4+Pgo+Pj4gQmVzdCB3b3VsZCBiZSB0
byB0cmlnZ2VyIGFuIEhXIHJlc2V0IG9mIFBIWSBmcm9tIGdsdWUgYWZ0ZXIgc2V0dGluZyB0aGUK
Pj4+IHJlZ2lzdGVyIEVUSF9QSFlfQ05UTDAuCj4+Pgo+Pj4gTWF5YmUgdGhpcyBwYXRjaCBjb3Vs
ZCBoZWxwIDogPwo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2picnVuZXQvbGludXgvLS9jb21taXQv
Y2NiYjA3YjBjOWViMmRlMjY4MThlYjRmOGFhMWZkMGU1YjMxZTZkYi5wYXRjaAo+Pj4KPj4gVGhh
bmtzIGZvciB0aGUgaGludCwgSSdsbCBsb29rIGF0IGl0IGFuZCB0ZXN0Lgo+PiAKPj4+IEkgdHJp
ZWQgdGhpcyB3aGVuIHdlIGRlYnVnZ2VkIHRoZSBjb25uZWN0aXZpdHkgaXNzdWUgb24gdGhlIGcx
MiBlYXJsaWVyCj4+PiB0aGlzIHNwcmluZy4gSSBkaWQgbm90IHNlbmQgaXQgYmVjYXVzZSB0aGUg
cHJvYmxlbSB3YXMgZm91bmQgdG8gYmUgaW4KPj4+IHN0bW1hYy4KPj4+Cj4+IAo+Cj4gSSB0ZXN0
ZWQgdGhlIHBhdGNoIHdpdGggYSBzbGlnaHQgbW9kaWZpY2F0aW9uLiBNYXliZSB0aGUgUEhZIHBp
Y2tzIHVwIG90aGVyCj4gc2V0dGluZ3MgYWxzbyBvbiBwb3dlci11cC9zb2Z0LXJlc2V0IG9ubHku
IFRoZXJlZm9yZSBJIG1vdmVkIHNldHRpbmcKPiBFVEhfUEhZX0NOVEwyIHRvIGJlZm9yZSBwb3dl
cmluZyB1cCB0aGUgUEhZLiBEbyB5b3UgdGhpbmsgdGhhdCdzIG5lZWRlZC9iZXR0ZXI/CgpTb21l
dGhpbmcgaW4gYmV0d2Vlbi4KVGhlIGZpcnN0IHdyaXRlIHRvIENOVEwxIHBvd2VycyBvZmYgdGhl
IFBIWSBpZiBpdCB3YXMgb24uCkkgdGhpbmsgSSdsbCBjaGFuZ2UgQ05UTDIgd2hpbGUgdGhlIFBI
WSBpcyBkb3duIGFuZCB0aGVuIHBvd2VyIGl0IGJhY2sgdXAKCj4KPiBXaXRoIHRoaXMgcGF0Y2gg
dGhlIG5ldyBQSFkgSUQgaXMgZWZmZWN0aXZlIGVhcmx5IGVub3VnaCBhbmQgdGhlIHJpZ2h0Cj4g
UEhZIGRyaXZlciBpcyBsb2FkZWQgYWxzbyB3L28gb3ZlcnJpZGluZyB0aGUgUEhZIElEIHdpdGgg
YSBjb21wYXRpYmxlLgo+Cj4gQmFzZWQgb24gd2hpY2ggdmVyc2lvbiBvZiB0aGUgcGF0Y2ggeW91
IHByZWZlciwgYXJlIHlvdSBnb2luZyB0byBzdWJtaXQgaXQ/Cj4gRWxzZSBJIGNhbiBkbyBpdCB0
b28sIGp1c3QgbGV0IG1lIGtub3cuCgpUaGFua3MgZm9yIHRlc3RpbmcuIEkgd2lsbCBzdWJtaXQg
aXQgc29vbi4KCj4KPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1l
c29uLWcxMmEuYyBiL2RyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZzEyYS5jCj4gaW5k
ZXggOWQyMWZkZjg1Li43ODgyZGNjZTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvbWRpby9t
ZGlvLW11eC1tZXNvbi1nMTJhLmMKPiArKysgYi9kcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1l
c29uLWcxMmEuYwo+IEBAIC02LDYgKzYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3Zp
ZGVyLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZGV2
aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xs
Lmg+Cj4gQEAgLTE0OCw2ICsxNDksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgZzEy
YV9lcGh5X3BsbF9vcHMgPSB7Cj4gIAo+ICBzdGF0aWMgaW50IGcxMmFfZW5hYmxlX2ludGVybmFs
X21kaW8oc3RydWN0IGcxMmFfbWRpb19tdXggKnByaXYpCj4gIHsKPiArCXUzMiB2YWw7Cj4gIAlp
bnQgcmV0Owo+ICAKPiAgCS8qIEVuYWJsZSB0aGUgcGh5IGNsb2NrICovCj4gQEAgLTE1OSwxNyAr
MTYxLDE5IEBAIHN0YXRpYyBpbnQgZzEyYV9lbmFibGVfaW50ZXJuYWxfbWRpbyhzdHJ1Y3QgZzEy
YV9tZGlvX211eCAqcHJpdikKPiAgCj4gIAkvKiBJbml0aWFsaXplIGVwaHkgY29udHJvbCAqLwo+
ICAJd3JpdGVsKEVQSFlfRzEyQV9JRCwgcHJpdi0+cmVncyArIEVUSF9QSFlfQ05UTDApOwo+IC0J
d3JpdGVsKEZJRUxEX1BSRVAoUEhZX0NOVEwxX1NUX01PREUsIDMpIHwKPiAtCSAgICAgICBGSUVM
RF9QUkVQKFBIWV9DTlRMMV9TVF9QSFlBREQsIEVQSFlfREZMVF9BREQpIHwKPiAtCSAgICAgICBG
SUVMRF9QUkVQKFBIWV9DTlRMMV9NSUlfTU9ERSwgRVBIWV9NT0RFX1JNSUkpIHwKPiAtCSAgICAg
ICBQSFlfQ05UTDFfQ0xLX0VOIHwKPiAtCSAgICAgICBQSFlfQ05UTDFfQ0xLRlJFUSB8Cj4gLQkg
ICAgICAgUEhZX0NOVEwxX1BIWV9FTkIsCj4gLQkgICAgICAgcHJpdi0+cmVncyArIEVUSF9QSFlf
Q05UTDEpOwo+ICAJd3JpdGVsKFBIWV9DTlRMMl9VU0VfSU5URVJOQUwgfAo+ICAJICAgICAgIFBI
WV9DTlRMMl9TTUlfU1JDX01BQyB8Cj4gIAkgICAgICAgUEhZX0NOVEwyX1JYX0NMS19FUEhZLAo+
ICAJICAgICAgIHByaXYtPnJlZ3MgKyBFVEhfUEhZX0NOVEwyKTsKPiArCXZhbCA9IEZJRUxEX1BS
RVAoUEhZX0NOVEwxX1NUX01PREUsIDMpIHwKPiArCSAgICAgIEZJRUxEX1BSRVAoUEhZX0NOVEwx
X1NUX1BIWUFERCwgRVBIWV9ERkxUX0FERCkgfAo+ICsJICAgICAgRklFTERfUFJFUChQSFlfQ05U
TDFfTUlJX01PREUsIEVQSFlfTU9ERV9STUlJKSB8Cj4gKwkgICAgICBQSFlfQ05UTDFfQ0xLX0VO
IHwKPiArCSAgICAgIFBIWV9DTlRMMV9DTEtGUkVROwo+ICsJd3JpdGVsKHZhbCwgcHJpdi0+cmVn
cyArIEVUSF9QSFlfQ05UTDEpOwo+ICsJdmFsIHw9IFBIWV9DTlRMMV9QSFlfRU5COwo+ICsJd3Jp
dGVsKHZhbCwgcHJpdi0+cmVncyArIEVUSF9QSFlfQ05UTDEpOwo+ICsJbWRlbGF5KDEwKTsKPiAg
Cj4gIAlyZXR1cm4gMDsKPiAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
