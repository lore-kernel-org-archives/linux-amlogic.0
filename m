Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1837AC83F25
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jul 2025 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crCrgBP1NeIY5vnAwvt47hbHsh4Qz5rLGpTCH+txWIs=; b=xbLHvUjCNECWxf
	5r5ZBCo8rA1WQbWEfAWen9CCT3z/vh9poPGX/XHEpDf7s1nx1lRcQJ5moo74Bw526Cz+aGg2vQ09b
	CgKIbqLdQTRkBpEuQL6B5wCLf3rjjwJhK9k1W92Q1Sd6+IrALXdtSk9JFBpx504kxhXUmJOL27dxC
	wmz15R3jhyoA4oWnmliLEclI7Jf8S4azM8OLtJrlIOJfaXjrSxhRweKLFkauVYMt1viQChHwQ+Mzo
	7vL8DZQv9kyXizGK9HJuJGEZSdLfYsSXr0UbDZG23I+YlkueSeqgq/puEUiMs985x1GYPxKjSgPe2
	fSewhTw68uDpG2aaIe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxC9-00000000dV6-3pDG;
	Mon, 21 Jul 2025 20:33:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwwI-00000000bEb-2Euz;
	Mon, 21 Jul 2025 20:16:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235d6de331fso54768285ad.3;
        Mon, 21 Jul 2025 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1753129005; x=1753733805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgpqx2m845uLW+JeBVNSuYCmRgFn5O1Bzp6CJmeS42g=;
        b=R3tjO+m4MZVvId35CSEeqh8lYGrFlQJHrp4A3bvn4UEqPkWRgnjP4uoimY/T1X5pGt
         jgKp73ilnt9ps1PCo6ABI1BLTMniYExKuA5J1bhlaBKJcHoKtLoR3PYe8hSRxwHAjRbV
         QzNnIq0/S17I7dqohgQ7gjzXxXrfVVr0W8xC9QSdo+tAESibOcSgGVRhn+Ybtyxu3wlz
         j59WmKRW5wpFp0wHXjp3vL5g2KGjabM3RTPFkYYlyS1pXwnunEwR5H4fLtETBolIQ7he
         RtTpGTPqOiYJHffPtZ6P/J529U5UElSYYU+OPMFLWGWVge/IHSwoZ9AaI67BIoKruAh/
         lUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129005; x=1753733805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgpqx2m845uLW+JeBVNSuYCmRgFn5O1Bzp6CJmeS42g=;
        b=JzGV73OoC86rFpub3GWQipoW1l5vfhmzQ09vxdD+LvbFUty33xZ0kxomkplnE6qD1C
         U+KIRNrU/8b+nbtlKkHqSErOpu+FeYVVFGDjR1bmyN3+vVjm+k2lBhHVoRuXmoVrXREQ
         Ni65MtuzWsSqObUCWF5FyC81gMoZPF+KqnaeXvy2MSOnmFVg5CMda3+VZShqg6BDQXd+
         ZqNDc8w2NFj5l545g1Zxb+jJF+p6aI9hdKbc24m2T7w/HX3jzXOPTvx0+/4TZkZlIrg2
         6d6TWZoPFcE4CHsvgIe7ogGrof7tnk2Q3J6LF/2iMjtW/l8aekL8XkbWrf7jheHLupwi
         Q9hA==
X-Forwarded-Encrypted: i=1; AJvYcCUuHqrnezSc7mqn6WkfRDw49iKktrGe8zTphmt8RIsN10Ls7ew+zDWmPkLzEcDV2atYfVcxl8+fHo0eAF9k@lists.infradead.org, AJvYcCXkSQhJ9muprVz9JEC+I/oAbFR7FUBd0AdXmY0zkYr7cB8zS8DRSv0AcqIH81N3lJqeRPjP1243QTBgnD2PqVKDug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6sKsdHbLcPXDU7lTI2TPeNiogyFddgzpkTSwnBedCxJwR2UG1
	VWdE691E1fqKqwOIPrZFez9VQmfLQzHlSvfZtuMuANXtNBee3LEJ5a0tSoLrD7Iz4a+NvgZaYCQ
	cwqxeeu8TwBpi2v1x7AbuyhBhf7O366E=
X-Gm-Gg: ASbGncsLjerXlYK06Ax1K49EJ2Mv22oriMQmMCYqJdtxLLBMtEn0GRHONl89EZnDRKH
	uQlTTs2rudf2NgkpmjKfcBBE0jwd0z8UYuyMBt/ekHbQB7jD7nziM8a0saD4SR5L6haVIlRc9AZ
	F7T+CLZaaYwNWH3IFZnVZvdVXrq5xXqQKj8ZwmCTctt60upBjaWIIkgGpk84pe5G6JivsPKhCYI
	frVPL6I6vlihX81DMMOcw==
X-Google-Smtp-Source: AGHT+IEhqRr7CdR9k19OYUc7jR748HGVgZNXD2c2iGAiOAD8tt2Y5vTG48a6wynS3HB30PHpt1YoNuo+jd0SaVpgE2s=
X-Received: by 2002:a17:902:e0d4:b0:23f:8bcc:e4f3 with SMTP id
 d9443c01a7336-23f8bcce86emr2555465ad.32.1753129005382; Mon, 21 Jul 2025
 13:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250717-optimize_clk-measure_accuracy-v1-1-3b82d7ccd743@amlogic.com>
 <CAFBinCDyjf7MOE6f_AGEEwqV8z68qRv6JAUxn7zt5ZZqwFLkPg@mail.gmail.com> <7fbd3743-cfda-4877-888d-bdeb28d4972f@amlogic.com>
In-Reply-To: <7fbd3743-cfda-4877-888d-bdeb28d4972f@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 21 Jul 2025 22:16:34 +0200
X-Gm-Features: Ac12FXwjzjGUO3kzYO-EgF4dY1ZYcLeDPum6VbXKfiPgtZh-GpYns-HcHy-gvj8
Message-ID: <CAFBinCBdCiNKWoXrL0tw1+_0BL_9XyYfuqQrRNePyzmUh=PX3Q@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize measurement accuracy
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131646_591616_F7A5C836 
X-CRM114-Status: GOOD (  27.40  )
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

T24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgODoxNOKAr0FNIENodWFuIExpdSA8Y2h1YW4ubGl1QGFt
bG9naWMuY29tPiB3cm90ZToKPgo+IGhpIE1hcnRpOgo+Cj4KPiBPbiA3LzE3LzIwMjUgMTE6NDMg
UE0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiA+
Cj4gPiBIZWxsbywKPiA+Cj4gPiB0aGFuayB5b3UgZm9yIHRoaXMgcGF0Y2ghCj4gPgo+ID4gT24g
VGh1LCBKdWwgMTcsIDIwMjUgYXQgNTowOOKAr0FNIENodWFuIExpdSB2aWEgQjQgUmVsYXkKPiA+
IDxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiBG
cm9tOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPiA+Pgo+ID4+IFRoZSBjeWNs
ZSBjb3VudCByZWdpc3RlciBoYXMgYSAyMC1iaXQgZWZmZWN0aXZlIHdpZHRoLCBidXQgdGhlIGRy
aXZlcgo+ID4+IG9ubHkgdXRpbGl6ZXMgMTYgYml0cy4gVGhpcyByZWR1Y2VzIHRoZSBzYW1wbGlu
ZyB3aW5kb3cgd2hlbiBtZWFzdXJpbmcKPiA+PiBoaWdoLWZyZXF1ZW5jeSBjbG9ja3MsIHJlc3Vs
dGluZyBpbiAoc2xpZ2h0bHkpIGRlZ3JhZGVkIG1lYXN1cmVtZW50Cj4gPj4gYWNjdXJhY3kuCj4g
PiBJIGNoZWNrZWQgdGhlIE1lc29uOCBkb3duc3RyZWFtIGNvZGUgWzBdIGFuZCBpdCB1c2VzIDB4
MDAwRkZGRkYgdG8KPiA+IG1hc2sgdGhlIHJlZ2lzdGVyIHZhbHVlIC0+IHRoaXMgbWVhbnMgdGhh
dCBvbGQgU29DcyBhbHNvIGhhdmUgYSAyMC1iaXQKPiA+IHdpZGUgd2lkdGguCj4gPgo+ID4gWy4u
Ll0KPiA+PiBIZXJlIGFyZSB0aGUgdGVzdCBjb21wYXJpc29ucyBiYXNlZCBvbiBDMzoKPiA+IFsu
Li5dCj4gPj4gSGVyZSBhcmUgdGhlIHRlc3QgY29tcGFyaXNvbnMgYmFzZWQgb24gQzM6Cj4gPiBJ
IGhhdmUgdGVzdGVkIHRoaXMgcGF0Y2ggd2l0aCBNZXNvbjhiIGJhc2VkIE9kcm9pZC1DMToKPiA+
IHByZS1vcHRpbWl6YXRpb246Cj4gPiAjIHRpbWUgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lc29u
LWNsay1tc3IvbWVhc3VyZV9zdW1tYXJ5IHwgZ3JlcCAtdiAiICAwICAiCj4gPiAgICBjbG9jayAg
ICAgICAgICAgICAgICAgICAgIHJhdGUgICAgcHJlY2lzaW9uCj4gPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgY2xrODEgICAgICAgICAgICAgICAg
IDE1OTM3MjM5NiAgICArLy01MjA4SHoKPiA+ICAgYTlfY2xrX2RpdjE2ICAgICAgICAgICAyNDAw
MDAwMCAgICArLy0zMTI1SHoKPiA+ICAgcnRjX29zY19jbGtfb3V0ICAgICAgICAgICAzMTI1MCAg
ICArLy0zMTI1SHoKPiA+ICAgaGRtaV9jaDBfdG1kcyAgICAgICAgIDE0NjM5OTAzOCAgICArLy00
ODA3SHoKPiA+ICAgc2FyX2FkYyAgICAgICAgICAgICAgICAgMTE0MDYyNSAgICArLy0zMTI1SHoK
PiA+ICAgc2RoY19yeCAgICAgICAgICAgICAgICA5NDQ0Mzc1MCAgICArLy0zMTI1SHoKPiA+ICAg
c2RoY19zZCAgICAgICAgICAgICAgICA5NDQ0Mzc1MCAgICArLy0zMTI1SHoKPiA+ICAgcHdtX2Qg
ICAgICAgICAgICAgICAgIDg0OTkyMTg3NSAgICArLy0zMTI1MEh6Cj4gPiAgIHB3bV9jICAgICAg
ICAgICAgICAgICA4NDk5MjE4NzUgICAgKy8tMzEyNTBIego+ID4KPiA+IHJlYWwgICAgMG0wLjEw
MnMKPiA+IHVzZXIgICAgMG0wLjAwNXMKPiA+IHN5cyAgICAgMG0wLjA2OXMKPiA+Cj4gPgo+ID4g
cG9zdC1vcHRpbWl6YXRpb246Cj4gPiAjIHRpbWUgY2F0IC9zeXMva2VybmVsL2RlYnVnL21lc29u
LWNsay1tc3IvbWVhc3VyZV9zdW1tYXJ5IHwgZ3JlcCAtdiAiICAwICAiCj4gPiAgICBjbG9jayAg
ICAgICAgICAgICAgICAgICAgIHJhdGUgICAgcHJlY2lzaW9uCj4gPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAgY2xrODEgICAgICAgICAgICAgICAg
IDE1OTM3MzQzOCAgICArLy0xNTYySHoKPiA+ICAgYTlfY2xrX2RpdjE2ICAgICAgICAgICAxMjAw
MDAwMCAgICArLy0xNTYySHoKPiA+ICAgcnRjX29zY19jbGtfb3V0ICAgICAgICAgICAzMjgxMyAg
ICArLy0xNTYySHoKPiA+ICAgaGRtaV9jaDBfdG1kcyAgICAgICAgIDE0NjM5ODQzOCAgICArLy0x
NTYySHoKPiA+ICAgc2FyX2FkYyAgICAgICAgICAgICAgICAgMTE0Mzc1MCAgICArLy0xNTYySHoK
PiA+ICAgc2RoY19yeCAgICAgICAgICAgICAgICA5NDQ0Mzc1MCAgICArLy0xNTYySHoKPiA+ICAg
c2RoY19zZCAgICAgICAgICAgICAgICA5NDQ0Mzc1MCAgICArLy0xNTYySHoKPiA+ICAgcHdtX2Qg
ICAgICAgICAgICAgICAgIDg0OTk5MjE4OCAgICArLy0xNTYySHoKPiA+ICAgcHdtX2MgICAgICAg
ICAgICAgICAgIDg0OTk5MjE4OCAgICArLy0xNTYySHoKPiA+Cj4gPiByZWFsICAgIDBtMC4xNzNz
Cj4gPiB1c2VyICAgIDBtMC4wMDhzCj4gPiBzeXMgICAgIDBtMC4xMDlzCj4gPgo+ID4gU28gdGhl
cmUncyBhbHNvIGFuIGltcHJvdmVtZW50IGluIGFjY3VyYWN5LiBUaGUgb25seSBkb3duc2lkZSBJ
J20KPiA+IHNlZWluZyBpcyB0aGF0IGl0IHRha2VzIDc1JSBleHRyYSB0aW1lIGZvciB0aGUgbWVh
c3VyZW1lbnQuIEZvciBtZQo+ID4gdGhpcyBpcyBpcnJlbGV2YW50IHNpbmNlIHdlIHVzZSB0aGlz
IGZvciBkZWJ1Z2dpbmcuCj4gPgo+ID4gWy4uLl0KPiA+PiArICAgICAgIC8qCj4gPj4gKyAgICAg
ICAgKiBIQUNLOiBUaGUgaW5wdXQgY2xvY2sgc2lnbmFsIHBhdGggZnJvbSBnYXRlIChDb250cm9s
bGVkIGJ5IE1TUl9SVU4pCj4gPj4gKyAgICAgICAgKiB0byBpbnRlcm5hbCBzYW1wbGluZyBjaXJj
dWl0IGluIGNsay1tZWFzdXJlIGhhcyBhIHByb3BhZ2F0aW9uIGRlbGF5Cj4gPj4gKyAgICAgICAg
KiByZXF1aXJlbWVudDogMjQgY2xvY2sgY3ljbGVzIG11c3QgZWxhcHNlIGFmdGVyIG11eCBzZWxl
Y3Rpb24gYmVmb3JlCj4gPj4gKyAgICAgICAgKiBzYW1wbGluZy4KPiA+PiArICAgICAgICAqCj4g
Pj4gKyAgICAgICAgKiBGb3IgYSAzMGtIeiBtZWFzdXJlbWVudCBjbG9jaywgdGhpcyB0cmFuc2xh
dGVzIHRvIGFuIDgwMM68cyBkZWxheToKPiA+PiArICAgICAgICAqIDgwMHVzID0gMjQgLyAzMDAw
MEh6Lgo+ID4+ICsgICAgICAgICovCj4gPj4gKyAgICAgICBmc2xlZXAoODAwKTsKPiA+IFdoYXQg
aXMgbmVlZGVkIHRvIG1ha2UgdGhpcyBub3QgYSBIQUNLIGFueW1vcmU/IElzIHRoZXJlIGEgcmVn
aXN0ZXIKPiA+IHRoYXQgd2UgY2FuIHBvbGwgZm9yIHRoZSBudW1iZXIgb2YgY2xvY2sgY3ljbGVz
IHRoYXQgaGF2ZSBwYXNzZWQ/Cj4KPgo+IFRoZSByZXF1aXJlZCBkZWxheSBkdXJhdGlvbiBpcyBm
cmVxdWVuY3ktZGVwZW5kZW50IG9uIHRoZSBtZWFzdXJlbWVudAo+IGNsb2NrIHNvdXJjZS4gVGhl
IGN1cnJlbnQgODAwzrxzIGRlbGF5IGlzIGNhbGN1bGF0ZWQgYmFzZWQgb24gYQo+IG1pbmltdW0g
aW5wdXQgY2xvY2sgZnJlcXVlbmN5IG9mIDMwa0h6LiBBdCBoaWdoZXIgaW5wdXQgZnJlcXVlbmNp
ZXMsCj4gdGhpcyBkZWxheSBjb3VsZCBiZSBwcm9wb3J0aW9uYWxseSByZWR1Y2VkLiBBcHBseWlu
ZyBhIHVuaWZvcm0gODAwzrxzCj4gZGVsYXkgdGhlcmVmb3JlIGFwcGVhcnMgb3Zlcmx5IGNvbnNl
cnZhdGl2ZSBmb3IgZ2VuZXJhbCB1c2UgY2FzZXMuCj4KPgo+IFRoZSBJUCBjdXJyZW50bHkgbGFj
a3MgYSBzdGF0dXMgcmVnaXN0ZXIgdG8gZGV0ZWN0IHdoZXRoZXIgdGhlIGlucHV0Cj4gY2xvY2sg
c2lnbmFsIGhhcyBzdWNjZXNzZnVsbHkgcHJvcGFnYXRlZCB0byB0aGUgaW50ZXJuYWwgbWVhc3Vy
ZW1lbnQKPiBjaXJjdWl0cnkuCj4KPgo+IFRoZSBkZXNpZ24gb2YgdGhpcyBJUCBoYXMgYmVlbiBt
YWludGFpbmVkIGZvciBtYW55IHllYXJzLiBGcm9tIGEKPiBoYXJkd2FyZSBkZXNpZ24gcGVyc3Bl
Y3RpdmUsIHRoZXJlIGlzIHJvb20gZm9yIG9wdGltaXphdGlvbiBpbiB0aGlzCj4gc2lnbmFsIHBy
b3BhZ2F0aW9uIGRlbGF5LiBGdXR1cmUgSVAgdXBkYXRlcyBtYXkgbm90IHJlcXVpcmUgc3VjaCBh
Cj4gbG9uZyBkZWxheS4KVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZGVzY3JpcHRpb24uIFRvIG1l
IHRoaXMgZG9lc24ndCBzZWVtIGxpa2UgYQoiaGFjayIgdGhlbiwgaXQncyBqdXN0IHNvbWV0aGlu
ZyB0aGF0J3MgbmVlZGVkIHRvIGludGVyZmFjZSB3aXRoIHRoZQpoYXJkd2FyZSBjb3JyZWN0bHku
Ck15IHN1Z2dlc3Rpb24gaXMgdG8gcmVwbGFjZSB0aGUgd29yZCAiSEFDSyIgd2l0aCAiTk9URSIu
CgpXaGF0IGRvIHlvdSB0aGluaz8KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
