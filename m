Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8E6C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EPLUhHXnU6yz8kDUkU1cVTptNWIAktiYVc1ODwWAY0=; b=gG5/HejxJfshs+
	A3U0eH1Tr3ny7JKcN+1hiyEA7IijJ+kPq1wgHBdYg/4D2HxvEJxIAiDwM5MNmIkZoisFNcoT2Ng3W
	WUeNMvpurfjTAZqV0zwpZxFId5HTL4PSdmmpb44QAnYYgV+AKNHb9Eutj+5d9AX6iXrqfy6VrOa6r
	Ujn/oTSgknZ+Y1kduNrdzWWMbuIxnUtBmpLVqVfD/4qSmcRGG4ojCbDYaxN8+4y4ntPk0oLStxSKr
	HoV4E/OSyocz3rS3ztMFabaIGmY6HCAClEeAYdws5fXhMPUh3kp9LWJAf+PB1/iq/RFrxF0orw4Dz
	w9JTAFdoecFYTMwDL7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYgF-00BwR4-2Y;
	Tue, 21 Mar 2023 09:53:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYgC-00BwPq-2u
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 09:53:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id i10-20020a05600c354a00b003ee0da1132eso2473634wmq.4
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679392396;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yA68mVCD9647FSmY0WIdU7C5V3TS02L03uEop8rxjQ=;
        b=j7FCeyRD6YBEXkRQv9mUPmCaBZopvhSVUbtRsIfzj/pnb4sqgsiAeDscdckWwXbJQo
         rjchjtuAqteH/0uW7PK9TnqwyoDcMRrcFz7dB33YBFhNPAseRGBOSnFSFF1j0sfC4pDm
         Baw24bVOKgGQ6ImuYOT2jDq/1oEJEwUaB80eP1jm2UWoPXPSfubmFCKdkED6PKIR6mOk
         DHx1w4KS1Aii4stKzbzr83UNUrIp4KKD+co/YPnxnGWlMBB+4EeyxqPZOBpBlGnEnAyg
         fHDV/uY1gYzSz5Z99GGxK6REzDia3BT2Fb/A5pD7b8IqziVsfd+iMHpitq1SgAo0i+w2
         omww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679392396;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8yA68mVCD9647FSmY0WIdU7C5V3TS02L03uEop8rxjQ=;
        b=CNzA5x1TiCqqzSRa9cZIEu7qG/GggIYmhgPk0vLeneHhrZIOArq4TVgOaR9T7MbuDW
         FPuTms6uHYujeWZB1poe0yYmWPIDZtKaRfRTgcBasVxlyrF0V87OH7ZJKUMOJVorwrNT
         XVfaNN8WD25JuNfzG3XSV+pjQpra6O8HWNtV2GrLer+ViP/J3W/cb6kjI1aocOWiFWfr
         hI7qDY5OvgrgdcGsUvsn59Au8iFJgfwNycC/nr1a/1u5xaffAqe7WqHIkP4GErRnZXqH
         +g6wvbf6JVVQXxtsxRZveEhBYkdaN1cHQ0yV1bsh8Lq/bWCV2Ga56AkdglgyOHWZr3hg
         L4Xw==
X-Gm-Message-State: AO0yUKXtFs+KMYZ+tOjZ3hiMpliw/NDQ1e/uMYcQtI4jNlEEIiUufnID
	Qtb97YrO3yqs6o4NlpB1MY5yaw==
X-Google-Smtp-Source: AK7set++dkFwaIUlLnHFajj9Ph/VXG0+DakPApcFT7auIiRl4rgMhGx0C7G/lIYM20rkGG0T7rr73A==
X-Received: by 2002:a1c:7717:0:b0:3e2:2467:d3f5 with SMTP id t23-20020a1c7717000000b003e22467d3f5mr1826132wmi.25.1679392396513;
        Tue, 21 Mar 2023 02:53:16 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id fc6-20020a05600c524600b003ee04190ddfsm4655830wmb.17.2023.03.21.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 02:53:16 -0700 (PDT)
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
 <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, kelvin.zhang@amlogic.com,
 qi.duan@amlogic.com
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
Date: Tue, 21 Mar 2023 10:41:33 +0100
In-reply-to: <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
Message-ID: <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_025320_957796_8817C380 
X-CRM114-Status: GOOD (  26.48  )
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

Ck9uIFR1ZSAyMSBNYXIgMjAyMyBhdCAxMDoyOSwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3
cm90ZToKCj4gSGkgTWFydGlu77yMCj4gCUZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciB5b3Vy
IHJlcGx5Lgo+Cj4gT24gMjAyMy8zLzIwIDIzOjM1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3Rl
Ogo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4gSGVsbG8gWXUgVHUsCj4+IE9uIE1vbiwgTWFyIDIw
LCAyMDIzIGF0IDEyOjM14oCvUE0gWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+
Cj4+PiBTaW5jZSB0aGUgcHJldmlvdXMgY29kZSBvbmx5IHByb3ZpZGVzICJyb19vcHMiIGZvciB0
aGUgdmlkX3BsbF9kaXYKPj4+IGNsb2NrLiBJbiBmYWN0LCB0aGUgY2xvY2sgY2FuIGJlIHNldC4g
U28gYWRkICJvcHMiIHRoYXQgY2FuIHNldCB0aGUKPj4+IGNsb2NrLCBlc3BlY2lhbGx5IGZvciBs
YXRlciBjaGlwcyBsaWtlIFM0IFNPQyBhbmQgc28gb24uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
WXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+IHBsZWFzZSBkZXNjcmliZSB0aGUg
Y2hhbmdlcyB5b3UgZGlkIGNvbXBhcmVkIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uKHMpCj4KPiBJ
J2xsIGFkZCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4+IFsuLi5dCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYuaCBiL2RyaXZlcnMvY2xrL21lc29uL3Zp
ZC1wbGwtZGl2LmgKPj4+IGluZGV4IGMwMTI4ZTMzY2NmOS4uYmJjY2FiMzQwOTEwIDEwMDY0NAo+
Pj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYuaAo+Pj4gKysrIGIvZHJpdmVy
cy9jbGsvbWVzb24vdmlkLXBsbC1kaXYuaAo+Pj4gQEAgLTEwLDExICsxMCwxNCBAQAo+Pj4gICAj
aW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+Cj4+PiAgICNpbmNsdWRlICJwYXJtLmgiCj4+
Pgo+Pj4gKyNkZWZpbmUgVklEX1BMTF9ESVZfVEFCTEVfU0laRSAgICAgICAgIDE0Cj4+IEluIHYx
IHlvdSB1c2VkIEFSUkFZX1NJWkUodmlkX3BsbF9kaXZfdGFibGUpIHdoZXJldmVyIHRoaXMgbmV3
IG1hY3JvCj4+IGlzIHVzZWQgaW5zdGVhZC4KPj4gSSB0aGluayB1c2luZyBBUlJBWV9TSVpFIGlz
IHRoZSBiZXR0ZXIgYXBwcm9hY2ggYmVjYXVzZSBpdCBtZWFucyB0aGUKPj4gcmVmZXJlbmNlcyB3
aWxsIHVwZGF0ZSBhdXRvbWF0aWNhbGx5IGlmIGFuIGVudHJ5IGlzIGFkZGVkL3JlbW92ZWQgZnJv
bQo+PiB2aWRfcGxsX2Rpdl90YWJsZQo+Cj4gSSBhZ3JlZSB3aXRoIHlvdS4gUGVyaGFwcyB0aGUg
a2V5IGlzIHRvIHVuZGVyc3RhbmQgd2hhdCBKZXJvbWUgc2FpZC4KCkkgYXNrZWQgeW91IHRvIGRl
c2NyaWJlIGhvdyB0aGlzIGRpdmlkZXIgYWN0dWFsbHkgd29ya3MuIE5vdCByZW1vdmUKQVJSQVlf
U0laRSgpLgoKVGhpcyBkaXZpZGVyIHVzZXMgdGFibGVzIG9ubHkgYmVjYXVzZSB0aGUgcGFyYW1l
dGVycyBhcmUgIm1hZ2ljIi4KSSdkIGxpa2UgdGhlIGRyaXZlciB0byBiZSBhYmxlIGNvbWUgdXAg
d2l0aCAiY29tcHV0ZWQiIHZhbHVlcyBpbnN0ZWFkLgoKV2hhdCBJIHJlcXVlc3RlZCBpcyBzb21l
IGV4cGxhbmF0aW9uIGFib3V0IGhvdyB0aGlzIEhXIGNsb2NrIHdvcmtzCmJlY2F1c2UgdGhlIGRv
Y3VtZW50YXRpb24gaXMgbm90IHZlcnkgY2xlYXIgd2hlbiBpdCBjb21lcyB0byB0aGlzLiBUaGVz
ZQp2YWx1ZXMgbXVzdCBjb21lIGZyb20gc29tZXdoZXJlLCBJJ2QgbGlrZSB0byB1bmRlcnN0YW5k
ICJob3ciLgoKVGhpcyBpcyB0aGUgc2FtZSBhcyB0aGUgUExMIGRyaXZlciB3aGljaCBjYW4gdGFr
ZSBhIHJhbmdlIGFuZCBjb21lIHVwCndpdGggdGhlIGRpZmZlcmVudCBwYXJhbWV0ZXJzLCBpbnN0
ZWFkIG9mIHVzaW5nIGJpZyBwcmUtY29tcHV0ZWQgdGFibGVzLgoKPgo+PiBBbHNvIEkgdGhpbmsg
dGhlcmUncyBhIGRpZmZlcmVudCB1bmRlcnN0YW5kaW5nIGFib3V0IHdoYXQgSmVyb21lCj4+IHBy
ZXZpb3VzbHkgd3JvdGU6Cj4+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGFjdHVhbGx5IGRlc2NyaWJl
IGhvdyB0aGlzIHZpZCBwbGwgd29yayBzbyB3ZSBjYW4KPj4+IHN0b3AgdXNpbmcgcHJlY29tcHV0
ZSAibWFnaWMiIHZhbHVlcyBhbmQgYWN0dWFsbHkgdXNlIHRoZSBJUCB0byBpdHMgZnVsbAo+Pj4g
Y2FwYWNpdHkuCj4+ICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIGlzIHRoYXQgeW91IGludGVycHJl
dGVkIHRoaXMgYXMgImxldCdzIGNoYW5nZQo+PiBBUlJBWV9TSVpFKHZpZF9wbGxfZGl2X3RhYmxl
KSB0byBhIG5ldyBtYWNybyBjYWxsZWQKPj4gVklEX1BMTF9ESVZfVEFCTEVfU0laRSIuCj4+IEJ1
dCBJIHRoaW5rIHdoYXQgSmVyb21lIG1lYW50IGlzOiAibGV0J3MgZ2V0IHJpZCBvZiB2aWRfcGxs
X2Rpdl90YWJsZQo+PiBhbmQgaW1wbGVtZW50IGhvdyB0byBhY3R1YWxseSBjYWxjdWxhdGUgdGhl
IGNsb2NrIHJhdGUgLSB3aXRob3V0Cj4+IGhhcmQtY29kaW5nIDE0IHBvc3NpYmxlIGNsb2NrIHNl
dHRpbmdzIGluIHZpZF9wbGxfZGl2X3RhYmxlIi4gTG9vayBhdAo+PiBjbGstbXBsbC5jIGFuZC9v
ciBjbGstcGxsLmMgd2hpY2ggYWxsb3cgY2FsY3VsYXRpbmcgYXJiaXRyYXJ5IHJhdGVzCj4+IHdp
dGhvdXQgYW55IGhhcmQtY29kZWQgdGFibGVzLgo+CgpleGFjdGx5IC4uLiBvciBhdCBsZWFzdCBh
biBleHBsYW5hdGlvbiBhYm91dCBob3cgaXQgd29ya3MgYW5kCndoeSBpdCBpcyB0b28gY29tcGxp
Y2F0ZWQgdG8gY29tcHV0ZSB0aGUgdmFsdWVzIGF0IHJ1bnRpbWUuCgo+IEluIGZhY3QsIHBsbCBh
bmQgbXBsbCBhcmUgYWxzbyBmaXhlZCByZWdpc3RlciB3cml0ZXMgY29ycmVzcG9uZGluZwo+IHZh
bHVlcy4KClRoYXQgaXMgbm90IHRydWUuIFRoZSBwbGwgYW5kIG1wbGwgZHJpdmVycyBhcmUgYWJs
ZSB0byBjb21wdXRlIHRoZWlyCnZhbHVlcyBhdCBydW50aW1lLiBQbGVhc2UgaGF2ZSBhIGxvb2sg
YXQgdGhlIGRyaXZlcnMuCgo+IEJ1dCBldmVyeSBTT0MgaXMgZGlmZmVyZW50LCBzbyBpdCBtYWtl
cyBtb3JlIHNlbnNlIHRvIHNldCBpdAo+IG91dHNpZGUuIFRoZSBWSUQgUExMIGlzIGEgZml4ZWQg
dmFsdWUgZm9yIGFsbCBjdXJyZW50IFNvQ3MuCj4KPj4gQmVzdCByZWdhcmRzLAo+PiBNYXJ0aW4K
Pj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
