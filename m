Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX,URI_NOVOWEL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37135C07E94
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 11:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB7B761412
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 11:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB7B761412
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N38YefADJFRjTyOsmeRUt8heXjKwJIEG20uYbiyteTo=; b=TOjwAS7h8qqK7E
	3gkVfcpJ0U7KaxW87nTOM2GCzIR7JHchwpQ0QWyoNuFnik1r1z85592putvITz+qkB8KfV58dMYF6
	dBrw4LZdSJWlQyIeL/LElthIaDtOSncQ/ubr1KIQfF06BcjwqAw5+cs08KNCZymsV+5sDK50XtYzg
	dcSMclHCyA0MOyqL+XQHnc2KZ+6pYIZusSN43gejqFHpdIf15USzsi89PxyJIczTBpNf06JPpSYLw
	jYzjfLjHrmUmWcewDF32EvRE7GbjopPUqDR/SJqF7adzYthVxR3uojz8qTfExh+pjhIbHa7tRnLe0
	//hKz9m1p4lUTgjBM1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp7jL-00DBYd-7q; Fri, 04 Jun 2021 11:11:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp7Wv-00D6H1-29; Fri, 04 Jun 2021 10:58:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D3D600D3;
 Fri,  4 Jun 2021 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622804299;
 bh=RpiLOvgSTldH32Z5nI8EixhVdPHH7DAf0w2UqTQw13c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JmXpTS1KqbpT3ioqIXQ7ezFZdB3if8+GfSHEwwv2djRfGtNXI6TCj5GNo6rvQs+73
 QXIjbVki5qZPzo/stXpFZFn0bNH6syOPnxB3lUJHfTsFjw2DKDjZdXrspv3HKIF+6J
 tU4WsBlji8q08rd0Qa43NzB3q/fiYrmiwuNtJSDU=
Date: Fri, 4 Jun 2021 12:58:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: balbi@kernel.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0
 is disabled
Message-ID: <YLoHSJIOSRTyF0r1@kroah.com>
References: <20210601084830.260196-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601084830.260196-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_035821_150637_B082BD6B 
X-CRM114-Status: UNSURE (   8.23  )
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

T24gVHVlLCBKdW4gMDEsIDIwMjEgYXQgMTA6NDg6MzBBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gV2hlbiBvbmx5IFBIWTEgaXMgdXNlZCAoZm9yIGV4YW1wbGUgb24gT2Ryb2lkLUhD
NCksIHRoZSByZWdtYXAgaW5pdCBjb2RlCj4gdXNlcyB0aGUgdXNiMiBwb3J0cyB3aGVuIGRvZXNu
J3QgaW5pdGlhbGl6ZSB0aGUgUEhZMSByZWdtYXAgZW50cnkuCgo8c25pcD4KCk1ldGEgY29tbWVu
dCwgeW91IHNpZ25lZCB0aGlzLCBhbmQgaXQgd29ya2VkIQoKTG9va2luZyB1cCBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjEwNjAxMDg0ODMwLjI2MDE5Ni0xLW5hcm1zdHJvbmclNDBiYXls
aWJyZS5jb20KR3JhYmJpbmcgdGhyZWFkIGZyb20gbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9n
aWMvMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFybXN0cm9uZyU0MGJheWxpYnJlLmNvbS90Lm1i
b3guZ3oKQW5hbHl6aW5nIDIgbWVzc2FnZXMgaW4gdGhlIHRocmVhZApDaGVja2luZyBhdHRlc3Rh
dGlvbiBvbiBhbGwgbWVzc2FnZXMsIG1heSB0YWtlIGEgbW9tZW50Li4uCi0tLQogIOKckyBbUEFU
Q0hdIHVzYjogZHdjMy1tZXNvbi1nMTJhOiBmaXggdXNiMiBQSFkgZ2x1ZSBpbml0IHdoZW4gcGh5
MCBpcyBkaXNhYmxlZAogICAgKyBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gKOKckyBES0lNL2xpc3RzLmluZnJhZGVh
ZC5vcmcpCiAgLS0tCiAg4pyTIFNpZ25lZDogb3BlbnBncC9uYXJtc3Ryb25nQGJheWxpYnJlLmNv
bQogIOKclyBCQURTSUc6IERLSU0vYmF5bGlicmUtY29tLjIwMTUwNjIzLmdhcHBzc210cC5jb20K
ICDinJMgU2lnbmVkOiBES0lNL2xpc3RzLmluZnJhZGVhZC5vcmcgKEZyb206IG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tKQotLS0KVG90YWwgcGF0Y2hlczogMQotLS0KIExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20KIEJhc2U6IG5vdCBmb3VuZApBcHBseWluZzogdXNiOiBkd2MzLW1lc29uLWcxMmE6IGZp
eCB1c2IyIFBIWSBnbHVlIGluaXQgd2hlbiBwaHkwIGlzIGRpc2FibGVkCgoKT2RkIHRoYXQgREtJ
TSBkaWRuJ3Qgd29yayBmb3IgYmF5bGlicmUtY29tLCBidXQgaGV5LCBJJ2xsIHRha2UgYSByZWFs
CnNpZ25hdHVyZSBvdmVyIERLSU0gYW55ZGF5IQoKdGhhbmtzIGZvciBkb2luZyB0aGlzLgoKZ3Jl
ZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
