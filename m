Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047E7C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Jan 2022 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRRZx1I10Bt3wVg6B/G1/yb/EsOL2AUsHeXyofpC7fY=; b=ToXfZkvwey91JE
	65MfJjMoMyuSe2ZNPoJKEoiEib1N3juwnEP7r4nWJI8b3WfFgt9+idY7iVfmO+KwfKSj3NV23WAMg
	+NrzN2DQHEIpRkK2LJ4fktXMH22XRTSdQBQAIlnWCIUrDfwyCg660BMcoG71yo0uZw+5yJirWI/w7
	q8DrMW6bzRunQcyAuME99z5SrLGjSfiaoo3KuQZdITJ4xLivIBm2VR7o+jL7mCLZDSbXhaEK1RDv3
	eTnpjt26C22EFXQSIlTcPoasnyFo5vrJ+pt3dAL8vEqdbH03WX6HjbQwDMMFSjzzvQf1433pnFoaI
	pgjHsz8TUl0kDQ4jjmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n46fL-0086ry-0w; Sun, 02 Jan 2022 19:37:15 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n46f8-0086qn-C2; Sun, 02 Jan 2022 19:37:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id f5so128503193edq.6;
 Sun, 02 Jan 2022 11:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uzAERIEZYtJsAijaT2QvW435vVYwBNMjvEfhVhmIpoI=;
 b=X7Tjc25U+hYXI+B2D5vMKce//4kBPegHGMfpeAX+uP9GFV3PoKrqHYVuFNG2GW2za6
 9bbVpiOalULkX0stLnVxCVgHTuh/3VhBKz7vV3G1ons/CYAZ60t9IDV8hr8/cMb/AZZ1
 Mv3GqGICQnAvGYel7hC3i0LbZbr5UXX9ek0wFd3pNbWlT0IZ0bzRula1AKIiyZFobwuY
 xUxl8KOCMSwapwquwv0+K9wWJfqJ0qbRLgANTpGkpXppwS7HtO/f663A6NP34jn6GJnQ
 /MrcCQBSQi2AvXyFM0M76oHSwtEBb1VSuEPtyRDzT73KgRV1wWDV2XDRsnY5XUQ/M8ep
 /Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uzAERIEZYtJsAijaT2QvW435vVYwBNMjvEfhVhmIpoI=;
 b=LApCSg8IMDNp8sz3SDJK6vkGYmrZIoGt/7McWaolAghLMt4XU1ZsRD8TnLsjUEAelz
 W8rioMQrrLPSuw6FjHssuAkb9JzpvUeL8ThPDaToEnUOFPIBiRQU7h0n8mzD8DbuZUGS
 iuKKDnyOu2COptM9iX55PQZiVU4akH+z0vz8iv//qzb2cTpgIGYNcm4Cf4td5pLVBhxh
 mrDnrVYxrFaYS55YOj8jtgmsqhYPy/iok8d862vuuQ22eYl0EumC32r1UgB0tWb9wLcG
 Cf2nG2koiNM+efb59vlbZVURdJ2zh+xkuhNeez/byHZdecATP3BCZNd9So+V3//yX406
 CJQA==
X-Gm-Message-State: AOAM530onzAWgfxvVYxaY5hGjGzf2I0lzLTVCREM5UL9WjzDgV/tFoRs
 v/0+lCq77BujeBCwD5LXwho/Xq9i020EO8o/zEbgqG2L+xE=
X-Google-Smtp-Source: ABdhPJyA5JDjOj3D7kdnhw3GydVhkJJ79iI3UrO51EvXQ4tl9sz/KzZ3LjetLzazLYQ9J2BpMXjF0rDNtrnThAkP+14=
X-Received: by 2002:a05:6402:1b9c:: with SMTP id
 cc28mr41250867edb.219.1641152219124; 
 Sun, 02 Jan 2022 11:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
 <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
 <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
 <CAFBinCB2nF0TwRE1uJ4UTB_avcqRBfOHR1CDSe29dB1o-YjEHQ@mail.gmail.com>
 <7278bace-a2b9-0cfc-55b3-c19311e3352e@amlogic.com>
In-Reply-To: <7278bace-a2b9-0cfc-55b3-c19311e3352e@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 2 Jan 2022 20:36:48 +0100
Message-ID: <CAFBinCCwE1DbP+Y49o3WxNdeE11ZK=HcGbXa0Sq52tch+eNhrQ@mail.gmail.com>
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate calculation
 is described using the common clock code. Also added S4 chip uart
 Compatible.
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_113702_475253_148912B1 
X-CRM114-Status: GOOD (  18.68  )
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

SGksCgpPbiBTYXQsIEphbiAxLCAyMDIyIGF0IDI6MzAgUE0gWXUgVHUgPHl1LnR1QGFtbG9naWMu
Y29tPiB3cm90ZToKWy4uLl0KPiA+IEludGVyZXN0aW5nLCB0aGFua3MgZm9yIHNoYXJpbmcgdGhh
dCB1LWJvb3QgdHVybnMgdGhlc2UgY2xvY2tzIG9uLgo+ID4gTGV0J3Mgc2F5IHNvbWVvbmUgd2Fu
dGVkIHRvIG1ha2UgdS1ib290IHNhdmUgcG93ZXIgYW5kIHR1cm4gb2ZmIGFsbAo+ID4gVUFSVCBj
bG9ja3MgZXhjZXB0IHRoZSBvbmUgZm9yIHVhcnRfQU8gKHdoZXJlIHdlIHR5cGljYWxseSBjb25u
ZWN0IHRoZQo+ID4gc2VyaWFsIGNvbnNvbGUpLgo+ID4gSW4gdGhhdCBjYXNlIHRoZSBwY2xrIG9m
IHVhcnRfQyAoanVzdCB0byBjaG9vc2UgYW4gZXhhbXBsZSBoZXJlKSBpcwo+ID4gdHVybmVkIG9m
Zi4gV291bGQgdGhlcmUgYmUgYSBwcm9ibGVtIHRoZW4gYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMg
b2YKPiA+IHVhcnRfQyBiZWZvcmUgY2xrX3ByZXBhcmVfZW5hYmxlIGlzIGNhbGxlZD8KPiBUaGUg
d2F5IHlvdSBkZXNjcmliZSBpdCwgaXQgZG9lcyBoYW5nLiBUaGlzIHdvdWxkIG5vdCBiZSByZWNv
bW1lbmRlZCBvbgo+IGFjdHVhbCBwcm9qZWN0cy4KPgo+IEF0IHByZXNlbnQsIEFtTG9naWMgY2hp
cHMgYXJlIG9sZGVyIHRoYW4gUzQgU29jLCBhbmQgd2UgaGF2ZSBubyB3YXkgdG8KPiBkZWFsIHdp
dGggdGhpcyBwcm9ibGVtLiBXZSBoYXZlIHRvIHRlbGwgY3VzdG9tZXJzIG5vdCB0byB1c2UgaXQg
aW4gdGhpcwo+IHdheeOAgkN1c3RvbWVycyByYXJlbHkgdXNlIGl0IGluIHJlYWwgcHJvamVjdHMu
T24gdGhlIFM0IFNPQyB3ZSB3aWxsIHVzZQo+IGEgY2xvY2sgbGlrZSB0aGUgVUFSVCBwY2xrIHRv
IGNvbnRyb2wgdGhlIHNodXRkb3duIHVzaW5nIHR3byByZWdpc3RlcnMsCj4gb25lIHNhZmUgKG5l
ZWQgdG8gb3BlcmF0ZSBpbiBFTDMpIGFuZCBvbmUgbm9ybWFsIChFTDEpLiBJdCB3aWxsIG9ubHkg
YmUKPiBjbG9zZWQgaWYgYm90aCByZWdpc3RlcnMgYXJlIGNsb3NlZC4gVGhpcyBtYWlubHkgcHJl
dmVudHMgbWlzb3BlcmF0aW9uLgpvaCwgaW50ZXJlc3RpbmcgdGhhdCB0aGVyZSdzIHNvbWUgdXBk
YXRlcyBzcGVjaWZpY2FsbHkgd2l0aCB0aGUgUzQgU29DcyA6LSkKCj4gV2l0aCB5b3VyIGV4cGVy
aWVuY2UsIEknZCBsaWtlIHRvIGtub3cgaG93IHlvdSBkZWFsIHdpdGggdGhpcyBraW5kIG9mCj4g
cHJvYmxlbS4KQmVmb3JlIHRoaXMgcGF0Y2ggdGhlIGRyaXZlciBzaW1wbHkgdHVybnMgb24gdGhl
IGNsb2NrIGZyb20gd2l0aGluCm1lc29uX3VhcnRfcHJvYmUoKSAoc3BlY2lmaWNhbGx5IGl0IGRv
ZXMgc28gaW4KbWVzb25fdWFydF9wcm9iZV9jbG9jaygpKS4KSSB0aGluayB0aGVyZSdzIGFkdmFu
Y2VkIHBvd2VyLXNhdmluZyB0ZWNobmlxdWVzLiBNYXliZSBmb3Igbm93IHdlCmtlZXAgaXQgc2lt
cGxlIGFuZCBqdXN0IGVuYWJsZSB0aGUgY2xvY2socykgYXQgcHJvYmUgdGltZSBhbmQgZGlzYWJs
ZQp0aGVtIGF0IGRyaXZlciByZW1vdmUgdGltZS4gV2hhdCBkbyB5b3UgdGhpbms/CgoKQmVzdCBy
ZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
