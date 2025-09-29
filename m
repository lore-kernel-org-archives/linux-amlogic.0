Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B172CAC5B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Sep 2025 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeisXDMPwlfFssq5b/6QWmEuCh4WCa3a8EPhGRcYyrw=; b=NV0/qm6UPSG26W
	puFCs8Im+xpiC+we+owai1zpbPnMXj6WUY/HXiMr6yDakIm6mBBajLhU0IHDc0uJcW2V/lFsLqdB6
	uROpvLLGst7QoRJN+xXHydI0Bvssu9Q3y97xwgSnMMIdOkWiBGZ58H0Ry2HOmc29+6i6xnLz2/gZB
	Au4wb+nQp2vzqA0cVnHxVYHVbBL7SV/nf5ynT2wckOgX4sGh8w9QmG/CCYXWjHTjGZWH0/7EGWbNc
	p7+v1WfvW8V52pLnbne3O82ENcJ4+lqvNPql378KmlJjFaBdv2c6k/g+/TSbZPyC/6zMn8LLpU88c
	rtRNnfJQI980P6ca1+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DPc-00000002VOK-0FzF;
	Mon, 29 Sep 2025 12:55:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DPY-00000002VMt-0pZc
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Sep 2025 12:55:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso29563025e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Sep 2025 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759150522; x=1759755322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=;
        b=a2wQsJbJ4CnEj88R5M1v0nU2z0aFXXDk7BQA50VfjPco0ax+Mm+vWZjhusKvTwBu6U
         8I6wqCcGmSgyRzRRR9cMqCsjwSq6EWLsR0ukZ1FTmIwl1MBK9c+5zDk1JPsQrH/zeXxp
         3ew/XjQUaYEq+6r1cOM43VuSDI7LebiHHeSqXIdFHknniTOAutkfyhRcM+uJHTLDt7Xi
         NeBdgnlZGMUn3xYWe4+yvmiVGOR16ZInM0zEaP4W5lXAM2bykD0dcjyUXLOQHoA4nDM3
         8lifhqYQQQN4Kwv/PQ1UkR9h8Ruw7lI/4knUP2W+AlD+dz9l41kyKY9mzU6fvlys4EB1
         ThNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759150522; x=1759755322;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4AJhIRDhtQztFOcWyZbbOIS6wbTlWTjViXERoklQ24=;
        b=CBtS5bx2H+PpTHezCWdMct9FptZmj5hR0J4eaXJ9o3NBVqJ1w38wMC/tQyPp7MD6U/
         TaUmBgIPVptlBWiZIXPLGWxKg2yFsWzLy4VCF1MPeg337PV0NzqiUxz3JeYr0RuxxxBb
         PQETLFIG109LX9xyBymwuQoF50/X/iEWp28pJ37OXTUVvIqzhw8vH6t84SWaAe9CPrbw
         9XUuez5AZwxzw4T8FEeWSYTMgkoiBfxFFxhL9Pl0ZW77ykLdR08ydKZoiiKX46p9csEi
         MCR+KELZC1wZK1+l2wJnaAvC33+HXncbpt/4KyAelKsMs74vZ4MHiJS/bWNY/XTIHpj5
         4/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUYjJ1XQUMxvOT5JGnSvs1NCr1Z+KY3JcpBN0jKP92qk2fxtQ1E+XOSVbRSN2x87o7KBz3bGH/5aV/YsjYL@lists.infradead.org
X-Gm-Message-State: AOJu0YxNdG46PjWpphLrQgTXu3mpH7uXe2j8n4qPDoEMIVIZEVostogK
	HDD4v4WAx3cLNTaKAE2VLgljcuBWqZQ1ypd5lBR69DL92b+YfvEcas62K+XcpHohBV3XSWgVRkN
	5K9Qn
X-Gm-Gg: ASbGncsiAMezKaAIAIZOG9+WgnoA0nW4tiPPHCYh76AxlfeehAevbIq+M5LeBGlhlZ/
	4BklGU4X1yKeFGAfu88wwywTM5NTv4xUU7pw5sdx5umFA+J1u0suXnWjSeE7Tp47/c3Hd0j0eXs
	htBpWVW8ISCN4lTzos4a2A6kp5u0PdgT0+/Pc4+P7G5VwozsHBCODrKpdZA0wW8vU8jL15V65zy
	iMZkQcA5Zq2NoWqrb9oSZiXQv4vxm2/e3AKyJpp1FlC6UX64wP6w72+UEwdyeImcUG+keLpmhzp
	z/uaIYCWV4anqy3D8tuBDFqzf8IRxsro1cE3slsO5GGmi5bwFEf4vcjj1uAuy8oClGeIuy+ap/6
	sh6CoGLkH9iSjyxHtiIUDW+N/BH0axC4=
X-Google-Smtp-Source: AGHT+IFVFN0XLFy2t2r8lsVdrqYeMn/8TCLqXkS7DTElSFf2//cTI3KRbqZwOsdLupaXoEn5NrWF2w==
X-Received: by 2002:a05:600c:3b23:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-46e32dd1cbemr151873375e9.7.1759150522095;
        Mon, 29 Sep 2025 05:55:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9ad:4617:2761:d4d0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e56f64849sm12304965e9.11.2025.09.29.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 05:55:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: meson: Fix glitch free mux related issues
In-Reply-To: <36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com> (Chuan Liu's
	message of "Mon, 29 Sep 2025 17:31:07 +0800")
References: <20240929-fix_glitch_free-v1-0-22f9c36b7edf@amlogic.com>
	<20240929-fix_glitch_free-v1-2-22f9c36b7edf@amlogic.com>
	<CAFBinCBd5-s6vaBoJNerXavQiHgsv4Fm3v0svUX7geL=kJvVYg@mail.gmail.com>
	<20178015-4075-40e9-bbf4-20ae558c2bef@amlogic.com>
	<1jldyzrv2t.fsf@starbuckisacylon.baylibre.com>
	<e70e9aaa-f448-4f67-9149-cb5970c9bbd6@amlogic.com>
	<9834c7c5-9334-4c78-a2fe-588ff03cf935@amlogic.com>
	<CAFBinCCoX5+6+KQAtbhKx9KdSZhXVxS=cz8DfMVhjPX1c0iSPw@mail.gmail.com>
	<1jfrc563wa.fsf@starbuckisacylon.baylibre.com>
	<36cd6282-ae1d-43f3-8738-592f043d0ba6@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Sep 2025 14:55:20 +0200
Message-ID: <1j1pnp5sg7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_055524_263301_3B7DC63C 
X-CRM114-Status: GOOD (  24.14  )
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

T24gTW9uIDI5IFNlcCAyMDI1IGF0IDE3OjMxLCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IE9uIDkvMjkvMjAyNSA0OjQ4IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3Rl
Ogo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gT24gU3VuIDI4IFNlcCAyMDI1IGF0IDIyOjU1
LCBNYXJ0aW4gQmx1bWVuc3RpbmdsCj4+IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwu
Y29tPiB3cm90ZToKPj4KPj4+IEhlbGxvLAo+Pj4KPj4+IE9uIFN1biwgU2VwIDI4LCAyMDI1IGF0
IDg6NDHigK9BTSBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Pj4K
Pj4+PiBPbiA5LzI4LzIwMjUgMjowNSBQTSwgQ2h1YW4gTGl1IHdyb3RlOgo+Pj4+PiBIaSBKZXJv
bWUgJiBNYXJ0aW46Cj4+Pj4+Cj4+Pj4+IFNvcnJ5IGZvciB0aGUgaW1wcmVjaXNlIGRlc2NyaXB0
aW9uIG9mIHRoZSBnbGl0Y2gtZnJlZSBtdXggZWFybGllci4KPj4+Pj4KPj4+Pj4gUmVjZW50bHks
IHdoaWxlIHRyb3VibGVzaG9vdGluZyBhIENQVSBoYW5nIGlzc3VlIGNhdXNlZCBieSBnbGl0Y2hl
cywKPj4+Pj4gSSByZWFsaXplZCB0aGVyZSB3YXMgYSBkaXNjcmVwYW5jeSBmcm9tIG91ciBwcmV2
aW91cyB1bmRlcnN0YW5kaW5nLAo+Pj4+PiBzbyBJJ2QgbGlrZSB0byBjbGFyaWZ5IGl0IGhlcmUu
Cj4+PiBbLi4uXQo+Pj4+IEFuIGV4YW1wbGUgb2YgdGhlIGNsb2NrIHdhdmVmb3JtIGlzIHNob3du
IGJlbG93Ogo+Pj4+Cj4+Pj4KPj4gICAgICAgICAgICAgICAgICAgICAgIDEgICAgICAgICAgICAg
ICAgICAyCj4+ICAgICAgICAgICAgICAgICAgICAgICB2ICAgICAgICAgICAgICAgICAgdgo+Pj4+
ICAgICAgICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fICAgIF9fCj4+
Pj4gb3JpOiAg4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f4oaRICB8X1/ihpEgIHxfX+KGkSAgfF9f
4oaRICB8X1/ihpEgIHxfX+KGkQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgXgo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgMSAqIGN5Y2xlIG9yaWdpbmFsIGNoYW5uZWwuCj4+Pj4gICAgICAgICAg
XyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfICAgXyAgIF8gICBfCj4+Pj4gbmV3OiAg
4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaRIHxf4oaR
IHxf4oaRIHxf4oaRIHxf4oaRCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNSAq
IGN5Y2xlcyBuZXcgY2hhbm5lbC4KPj4+PiAgICAgICAgICBfXyAgICBfXyAgICAgICAgICAgICAg
ICAgICAgICAgIF8gICBfICAgXyAgIF8KPj4+PiBvdXQ6ICDihpEgIHxfX+KGkSAgfF9fX19fX19f
X19fX19fX19fX19fX1/ihpEgfF/ihpEgfF/ihpEgfF/ihpEgfF/ihpEKPj4+PiAgICAgICAgICAg
ICAgICBeICAgICAgICAgICAgICAgICAgICAgICAgXgo+Pj4+ICAgICAgICAgICAgICAgIHN0YXJ0
IHN3aXRjaGluZyBtdXguICAgICBzd2l0Y2ggdG8gbmV3IGNoYW5uZWwuCj4+IE9rIC4uLiBidXQg
d2hlbiBpcyBpdCBzYWZlIHRvIGRpc2FibGUgdGhlICJvcmkiIGNsb2NrID8KPj4gQ2FuIHlvdSBk
byBpdCBhdCAnMScgYWxyZWFkeSA/IG9yIGRvIHlvdSBoYXZlIHRvIHdhaXQgZm9yICcyJyA/Cj4K
Pgo+IEl0IHNob3VsZCB3YWl0IGZvciAiMiIsIGJlY2F1c2UgdGhlcmUgaXMgYSBzdGF0ZSBtYWNo
aW5lIGluIHRoZQo+IGdsaXRjaC1mcmVlIG11eCwgdGhpcyBzdGF0ZSBtYWNoaW5lIGlzIGRyaXZl
biBieSB0aGUgd29ya2luZyBjbG9jawo+IHByb3ZpZGVkIGJ5IGl0cyBjaGFubmVsIDAuCgpUaGVu
IEkgZG9uJ3QgdGhpbmsgdGhlIDIgZmxhZ3MgYXJlIGVub3VnaCB0byBtYWtlIGl0IHNhZmUKCk5v
dGhpbmcgZ3VhcmFudGVlcyB0aGF0IENDRiB3aWxsIHdhaXQgZm9yIHRob3NlIDUgY3ljbGVzIHRv
IHR1cm4gb2ZmCnRoZSBjbG9jayBub3RlZCAnb3JpJyBhYm92ZS4KCkkgdGhpbmsgeW91IG5lZWQg
bmV3IHNwZWNpZmljIG9wcyBmb3IgdGhpcyBtdXgKClNvbWV0aGluZyB0aGF0IHdvdWxkCiogcHJv
dGVjdCBib3RoIHBhcmVudHMgYmVmb3JlIGNoYW5naW5nIHRoZSBtdXgKKiBkbyB0aGUgYWN0dWFs
IGNoYW5nZQoqIHdhaXQgZm9yIGl0IHRvIHNldHRsZQoqIHJlbW92ZSB0aGUgcHJvdGVjdGlvbgoK
Pgo+Cj4+Cj4+PiBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCByZXBvcnQhCj4+PiBUaGlzIGlz
IGluZGVlZCBwcm9ibGVtYXRpYyBiZWhhdmlvci4gSSBndWVzcyB0aGUgcmVzdWx0IGlzIHNvbWV3
aGF0Cj4+PiByYW5kb206IGRlcGVuZGluZyBvbiBsb2FkIChwb3dlciBkcmF3KSwgc2lsaWNvbiBs
b3R0ZXJ5IChxdWFsaXR5KSwKPj4+IHRlbXBlcmF0dXJlLCB2b2x0YWdlIHN1cHBseSwgLi4uIC0g
b25lIG1heSBvciBtYXkgbm90IHNlZSBjcmFzaGVzCj4+PiBjYXVzZWQgYnkgdGhpcy4KPj4+Cj4+
PiBCYXNlZCBvbiB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBvbiB0aGlzIHRvcGljLCBteSBzdWdn
ZXN0aW9uIGlzIHRvCj4+PiBzcGxpdCB0aGUgb3JpZ2luYWwgcGF0Y2g6Cj4+PiAtIG9uZSB0byBh
ZGQgQ0xLX1NFVF9SQVRFX0dBVEUgd2hlcmUgbmVlZGVkIChJIHRoaW5rIHRoZSBtZXNvbjhiLmMK
Pj4+IGRyaXZlciBhbHJlYWR5IGhhcyB0aGlzIHdoZXJlIG5lZWRlZCkgdG8gYWN0dWFsbHkgZW5h
YmxlIHRoZQo+Pj4gZ2xpdGNoLWZyZWUgbXV4IGJlaGF2aW9yCj4+PiAtIGFub3RoZXIgb25lIHdp
dGggdGhlIENMS19PUFNfUEFSRU5UX0VOQUJMRSBjaGFuZ2UgKG1lc29uOGIuYyB3b3VsZAo+Pj4g
YWxzbyBuZWVkIHRvIGJlIHVwZGF0ZWQpIHRvIHByZXZlbnQgdGhlIGdsaXRjaC1mcmVlIG11eCBm
cm9tCj4+PiB0ZW1wb3JhcmlseSBvdXRwdXR0aW5nIGFuIGVsZWN0cmljYWwgbG93IHNpZ25hbC4g
SmVyb21lIGFsc28gYXNrZWQgdG8KPj4+IGRvY3VtZW50IHRoZSBiZWhhdmlvciBzbyB3ZSBkb24n
dCBmb3JnZXQgd2h5IHdlIHNldCB0aGlzIGZsYWcKPj4gWWVzIHBsZWFzZSBzcGxpdCB0aGUgY2hh
bmdlcyBhbmQgdmlzaXQgYWxsIHRoZSBjb250cm9sbGVycyBzaGlwcGluZyB0aGlzCj4+IHR5cGUg
b2YgbXV4ZXMuCj4+Cj4+PiBCb3RoIHBhdGNoZXMgc2hvdWxkIGdldCB0aGUgcHJvcGVyICJGaXhl
cyIgdGFncy4KPj4gLi4uIGFuZCBwcm9wZXIgZml4ZXMgdGFnIG1heWJlIGRpZmZlcmVudCBkZXBl
bmRpbmcgb24gdGhlIGNvbnRyb2xsZXIgc28KPj4gdGhlcmUgbWlnaHQgbW9yZSB0aGF0IGp1c3Qg
MiBjaGFuZ2VzLgo+Pgo+Pj4gSSB0aGluayBpdCB3b3VsZCBhbHNvIGJlIGdyZWF0IGlmIHlvdSBj
b3VsZCBpbmNsdWRlIHRoZSB3YXZlZm9ybQo+Pj4gZXhhbXBsZSBpbiBhdCBsZWFzdCB0aGUgY29t
bWl0IG1lc3NhZ2UgYXMgaXQgaGVscHMgdW5kZXJzdGFuZCB0aGUKPj4+IHByb2JsZW0uCj4+Pgo+
Pj4gTGV0J3MgYWxzbyBnaXZlIEplcm9tZSBzb21lIHRpbWUgdG8gY29tbWVudCBiZWZvcmUgeW91
IHNlbmQgcGF0Y2hlcy4KPj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gTWFydGluCj4+IC0t
Cj4+IEplcm9tZQoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
