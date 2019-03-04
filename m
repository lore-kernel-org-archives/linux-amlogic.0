Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCD2C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 15:34:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9FE20657
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 15:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S0/4cBrA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lzWT85go"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9FE20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qukKOuCSYh0uO+KkEH0ZSdSk42GUILUh96TBdS6hhU=; b=S0/4cBrAj/4B/C
	G/MK7dsMXNzy825BEhl6JK6dB5WYT9gD4XbxjGlLQ7FraselHLzpRNhOT4BWvBbpJj+Zq9HgqkAPo
	NNktyivIznGA3NHI4aTMl18ZjlVsQcYLgFdaJo06dRfag+n37NWjnPj95hDwNVexvFCLK1RE619yp
	spfxMNTxs8gIyT9J9+HihDQlfydiGTK1MPbIVPvzOuaiuDd4kjurdkbrSVE8Xwq9/MyD7bmT8AZMi
	V2dW7EerQ9d9FihUEhsIReL479Ty9JLW9/h7qyNHws59BSw+2poqkBNO8xmvqPMSwkJusPGKVEGs7
	xXhAvSzsdm+zoPhdRlWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0pbU-0006t7-EB; Mon, 04 Mar 2019 15:34:08 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0pbR-0006rn-0e
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 15:34:07 +0000
Received: by mail-wm1-x344.google.com with SMTP id y15so5137720wma.0
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 07:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=eHLzMaflcKxdwe4CZZPc5ROFcg5MlA3WQCKWNyRakfQ=;
 b=lzWT85gok/qFRphJdn4kZKiISgv11BK/WdnvcaKW4q8HnyNGN3tQsfzfiJw1eAxiRG
 W62xcILES/+U9Wunzh2Cw5f5PSa2364c07DY9/n32SDhnwidEf1G9YjCrCYWe6gPV/qn
 m0/yeBD8U/E4PufVhbHChfB2K9f26m1oSKwFGqwnMkEUNQ7mRWa17IH91QliVZQUfvVJ
 seeiw0YFX5+y9ceD1lUYopBrPOFbu8++W2dITCNYuPUSdlw1xs0tKZs9TfdFP8Wu5kqD
 eJR29JaecsooC+jM8GERc1mB+IqOhYE7XPBWOu1YI8j0EAoueGht8LNJ/j5jnvs3kSzK
 OHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=eHLzMaflcKxdwe4CZZPc5ROFcg5MlA3WQCKWNyRakfQ=;
 b=CLvkh6i+a0rppWU/NdHZHJbu9y2OEjQHQJhvg/UOrMxTQPD0zVujwo0iYnE+3JyVca
 hzVmPJUEJ7RLdX+uJ8kIMA1a8NneqySO1GSUHzWuVcqbbsr90y9Tfsi8yUvDG3/YgMEJ
 IPWcS2pyrTtYAxQ9riOucG7EUClAAQ6LGSIYdOlLNOeZutU3i3FDaJ97BWsoiv/GthU+
 ZnDZzOpYWyxgHezjD8PBVI3JdDX4NGlX3xLw7Eu13BpWqEKFIsqWe3o+mPuAG30V4Iz1
 HF0EDscuJ+dHWSMkxCZmg1+jLh6dYBFj4BDoRQ/IiQP8xDvuPJVI8jLwmmn6RYe10Vjw
 koEw==
X-Gm-Message-State: AHQUAuanOCkZXgD3LU0oNol2tAVorjQUmqP3nFzgBtZjoLhHE7WwCXv6
 sh3R7spm1M2dwtt62xkYVxw3iLOmfQs=
X-Google-Smtp-Source: AHgI3IZwhdmcJHw2huv4Jz4yFzrGXVo7nlCVlsznb64Zp9gHzqxMzuvBoj4IWreyOOeSOvFj1QTLVg==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr10961348wmc.94.1551713642928; 
 Mon, 04 Mar 2019 07:34:02 -0800 (PST)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 65sm12328751wrb.62.2019.03.04.07.34.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 04 Mar 2019 07:34:02 -0800 (PST)
Message-ID: <d1e057447b1c9ca832db3161242e35963bb15ba0.camel@baylibre.com>
Subject: Re: Possible regression in driver meson-gx-mmc in kernel 5.0.0
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?ISO-8859-1?Q?Andr=E9?= Balsa <andrebalsa@gmail.com>, 
 linux-amlogic@lists.infradead.org
Date: Mon, 04 Mar 2019 16:34:01 +0100
In-Reply-To: <CAJDSL=W7X3am=iCOvafyzLuL8hzZriDWh4Zs2zfgBZDdDJtx7w@mail.gmail.com>
References: <CAJDSL=VG2YbAwuL_1SOVfWfD4gWquNG353p8LkCP+jiFpiN=9A@mail.gmail.com>
 <CAJDSL=W7X3am=iCOvafyzLuL8hzZriDWh4Zs2zfgBZDdDJtx7w@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_073405_103509_9DF7048C 
X-CRM114-Status: GOOD (  13.53  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDE5LTAzLTA0IGF0IDE0OjQ2ICswMTAwLCBBbmRyw6kgQmFsc2Egd3JvdGU6Cj4g
SGVsbG8sIG15IGZpcnN0IHBvc3QgdG8gdGhlIGxpc3QsIG5pY2UgdG8gbWVldCBldmVyeWJvZHku
Cj4gCj4gSSBjYW5ub3QgYm9vdCBrZXJuZWwgNS4wLjAgb24gbXkgUzkwNSBUViBib3ggKHVzaW5n
Cj4gbWVzb24tZ3hiYi1wMjAxLmR0YikgZnJvbSBhbiBTRCBjYXJkLCBzZWUgdGhlIGVycm9ycyBi
ZWxvdyAoY2FwdHVyZWQKPiBmcm9tIHNlcmlhbCBvdXRwdXQpLgoKQXMgSSBhbHJlYWR5IHBvaW50
ZWQgb3V0IHRvIHNvbWVib2R5IGVsc2UsIGl0IGlzIGRpZmZpY3VsdCB0byBnaXZlIGFueSBmb3Jt
IG9mCnN1cHBvcnQgZm9yIGJvYXJkcyB3ZSBrbm93IG5vdGhpbmcgYWJvdXQsIGVzcGVjaWFsbHkg
dGhlIG9uZSB0aGF0IGFyZQonY29udmVuaWVudGx5JyB1c2luZyB0aGUgRFQgb2YgdGhlIHJlZiBk
ZXNpZ24KCj4gCj4gSWYgSSByZXZlcnQgb25seSBtZXNvbi1neC1tbWMuYyB0byB0aGUgdmVyc2lv
biBpbiBrZXJuZWwgNC4yMC4xMywKPiBrZXJuZWwgNS4wLjAgYm9vdHMgd2l0aG91dCBhbnkgcHJv
YmxlbXMuCgpZb3UgcmV2ZXJ0ZWQgbW9yZSB0aGFuIG9uZSBwYXRjaCBoZXJlLgoKPiAKPiBJdCBz
ZWVtcyB0aGUgcHJvYmxlbXMgb2NjdXIgYmVjYXVzZSBvZiBwYXRjaGVzIGludHJvZHVjZWQgYnkg
SmVyb21lCj4gQnJ1bmV0IGluIERlY2VtYmVyLCBzZWUKPiBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAxOC8xMi82Lzc0NQo+IAo+IE15IGd1ZXNzIGlzIHRoZSByZW1vdmFsIG9mIHRoZSBzcGlubG9j
ayBhbGxvd3MgZm9yIHJhY2UgY29uZGl0aW9ucwo+IHRoYXQgY2F1c2UgdGhlIG1tYyBkcml2ZXIg
dG8gZmFpbCB3aGVuIHdyaXRpbmcgdG8gYW4gU0QgY2FyZC4KCjEpIEFzIHBvaW50ZWQgb3V0IGlu
IHRoZSByZWxhdGVkIGNvbW1pdCBtZXNzYWdlIHRoaXMgc3BpbmxvY2sgd2FzIHVzZWxlc3MuCkFu
eW9uZSBsb29raW5nIGF0IHRoZSBjb2RlIHNob3VsZCBiZSBhYmxlIHRvIHNlZSB0aGF0LiBXaGF0
IHlvdSBhcmUgc2VlaW5nIGlzCnRoZSByZXN1bHQgb2YgQ1JDIGVycm9ycy4KCjIpIFRoZSBsYXN0
IDIgcGF0Y2hlcyBvZiByZWxhdGVkIHNlcmllcyBoYWQgYmVlbiBzZW50IGFzIFJGVCwgYnV0IG5v
Ym9ieQpyZXBsaWVkLiAKClRoZXNlIDIgY2hhbmdlcyBoZWxwZWQgc2V2ZXJhbCBkZXNpZ25zIHdv
cmsgYW5kIEkgY291bGQgbm90IHNlZSBhbnkgcmVncmVzc2lvbgpvbiB0aGUgZGVzaWducyBJIGhh
ZCBhdCB0aGUgdGltZSwgaW5jbHVkaW5nIHRoZSBwMjAwCgpOb3cgd2UgZ290IHNldmVyYWwgcmVw
b3J0cyBvZiByZWdyZXNzaW9uLiAKCkl0IGlzIHZlcnkgZGlmZmljdWx0IHRvIGZpbmQgc2V0dGlu
Z3MgdGhhdCB3aWxsIHdvcmsgZm9yIHRoZSBhbGwgdGhlIGRlc2lnbnMuClRoZSBkb2N1bWVudGF0
aW9uIGlzIG5vdCB2ZXJib3NlIHJlZ2FyZGluZyB0aGlzLiBZb3UgY2FuJ3QgZXZlbiB0YWtlIHRo
ZQp2ZW5kb3Iga2VybmVsIGFzIHJlZmVyZW5jZSwgdGhlIGNvZGUgaXMgZXh0cmVtZWx5ICdmYW5j
eScgYW5kIHBoYXNlIHNldHRpbmdzCmFyZSBwZXJwZXR1YWxseSBjeWNsaW5nIHdpdGhpbiB0aGUg
aXJxIGhhbmRsZXIsIHdoaWNoIGlzIHVuYWNjZXB0YWJsZS4KCldlIGFyZSBhY3RpdmVseSB3b3Jr
aW5nIHRvIHNvbHZlIHRoaXMgYW5kIGhvcGVmdWxseSB3ZSB3aWxsIGJlIGFibGUgdG8gc2hhcmUK
c29tZXRoaW5nIHNvb24KCj4gCj4gSSBhbSBhdmFpbGFibGUgdG8gdGVzdCB0aGUgZHJpdmVyIGZ1
cnRoZXIgd2l0aCBhbnkgcHJvcG9zZWQgc29sdXRpb24uCj4gCj4gUmVnYXJkcywKPiBBbmRyZXcK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
