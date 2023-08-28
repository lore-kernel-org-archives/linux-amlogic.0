Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC60C83F12
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 08:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9iNctzt+nuHnPLIYg8qXLb+SodTPLu2xDm9RYtyniU=; b=TEGp4XSYamwwr2
	peJU29QwpfpYEUrzww4eVn93XI9Zoga4lV5xT0P2NQRoFJarxnEOf78XikepFcYXvlzqqCJNXFCNN
	83jcZgo8JazeNxo0Mq8rhCCsMn/cUrMVYjPSjKSMJe8Pjd3sdSV8jscqzhJHl+9Wzegg6MQCp3shv
	yTh2776oHbLNebUD8SOaHRRkuTy3c9G8Mn3E9KSd2DGgFru8XtDamDg5sKYLoAP6Gk8Z8VI7x3tBN
	N1jkZ7/QJoNK2aCEWN06Wp9ylFWiozI9Rbf0yhAUQi2Y8L/osp/FCY5wVxpyhnZnu4UqSbx7KdDzK
	CuWDGmpjxnOFsaxDvTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXuo-009AO6-2G;
	Mon, 28 Aug 2023 08:48:06 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaXuk-009ANF-16;
	Mon, 28 Aug 2023 08:48:04 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5925e580f12so34828207b3.3;
        Mon, 28 Aug 2023 01:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693212479; x=1693817279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ACD31EY/rxDEAChDoGR9W2f4aNhsarF9DV0zWxajQg=;
        b=eJ5eHqv+6rESC8Gtlyn7Zu+JbiPs2YjcpSjzx0zx1UW7ni8tUmKjroRkfIymeXfiaE
         Tev9jqrS0Q64YtEORTXecGKihPTASAFjhdy/T+wlk8oBSJbBYuVEx6EUXDeGOEShwCUO
         qejD7IpTdawjzs1N+G3kzSjL6vKjFPXfQ8fb5MU5f6nse4hxK9qXy/3yuUcbWZEqN6Dd
         QDvKEZwcEKH0slvp6C2cPspG8/KMyHXfuNcEZznYHWhgyGT4x+tP93glhmc4RGW/rONj
         /4bgI7xdOJ0dhG1jmrhbVRcslfLujaj9JDODAPf98Kc3+3n0eMWl9ipWki3P9OSTfA4q
         eKDg==
X-Gm-Message-State: AOJu0YwP5W79l1IBifcv5WHD9H0PlHnKwaYrGmxvx7DAGd7qbdvgjP1C
	7RtTuxmPSNo3r2b+GFlHOliuz+yqDtdNmf1x
X-Google-Smtp-Source: AGHT+IGUNVpn5rvYlb1kDaF0cnT9NfuAxJINzgLRifJ52Gs1qowSisXVk5hEWaGdr2fGvkh0ZUzhHQ==
X-Received: by 2002:a0d:d4d5:0:b0:577:616e:2d72 with SMTP id w204-20020a0dd4d5000000b00577616e2d72mr24892993ywd.5.1693212479241;
        Mon, 28 Aug 2023 01:47:59 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id u132-20020a0deb8a000000b005843155e284sm2017461ywe.49.2023.08.28.01.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 01:47:58 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58d31f142eeso35164007b3.0;
        Mon, 28 Aug 2023 01:47:58 -0700 (PDT)
X-Received: by 2002:a81:a014:0:b0:586:563:e61f with SMTP id
 x20-20020a81a014000000b005860563e61fmr27289825ywg.45.1693212478286; Mon, 28
 Aug 2023 01:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230827082944.5100-1-tanure@linux.com> <7bf9e716-0ff2-56d5-07ab-db027901454e@linaro.org>
 <09735262-1bc0-40cf-b139-22cccf70bcab@linux.com> <e73260c9-04f8-eb1e-bb5b-c3bd2219625e@linaro.org>
 <8d2ba0d3-55eb-45cf-b88a-bafef35e96b9@linux.com> <20230828082009.kehgwi4fxtj3bfze@CAB-WSD-L081021>
 <e070f432-28bd-465f-ad66-53add8b61907@linaro.org> <20230828084632.sp73jppcrfvc7nv3@CAB-WSD-L081021>
In-Reply-To: <20230828084632.sp73jppcrfvc7nv3@CAB-WSD-L081021>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 28 Aug 2023 09:47:47 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3x0XtARZwf0_Dh-skAF9Qj3S3uUmLv2mFJO3ZWR2+3og@mail.gmail.com>
Message-ID: <CAJX_Q+3x0XtARZwf0_Dh-skAF9Qj3S3uUmLv2mFJO3ZWR2+3og@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7 SoC"
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_014802_382153_1C0D398B 
X-CRM114-Status: GOOD (  48.63  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgOTo0NuKAr0FNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMTA6
MjM6NDVBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiAy
OC8wOC8yMDIzIDEwOjIwLCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiA+ID4gT24gU3VuLCBBdWcg
MjcsIDIwMjMgYXQgMTE6MzE6MzVBTSArMDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gPiA+
IE9uIDI3LTA4LTIwMjMgMTE6MjMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4gPiA+ID4gSGkg
THVjYXMsCj4gPiA+ID4gPgo+ID4gPiA+ID4gTGUgMjcvMDgvMjAyMyDDoCAxMjowNCwgTHVjYXMg
VGFudXJlIGEgw6ljcml0IDoKPiA+ID4gPiA+ID4gT24gMjctMDgtMjAyMyAxMDo0OCwgTmVpbCBB
cm1zdHJvbmcgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gSGkgTHVjYXMsCj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiBMZSAyNy8wOC8yMDIzIMOgIDEwOjI5LCBMdWNhcyBUYW51cmUgYSDDqWNyaXQg
Ogo+ID4gPiA+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCA2YTQxOTdmOTc2MzMyNTA0M2Fi
Zjc2OTBhMjExMjRhOWZhY2JmNTJlLgo+ID4gPiA+ID4gPiA+ID4gTmV3IFNvQyB3aWxsIHVzZSB0
dHlTMCBpbnN0ZWFkIG9mIHR0eUFNTCwgc28gVDcgU29DIGRvZXNuJ3QKPiA+ID4gPiA+ID4gPiA+
IG5lZWQgYSBPRl9FQVJMWUNPTl9ERUNMQVJFLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPiA+ID4g
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4gU2luY2UgVjE6Cj4gPiA+ID4gPiA+ID4gPiAt
IGFkZCBTaWduZWQtb2ZmLWJ5Ogo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ICAgIGRy
aXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAyIC0tCj4gPiA+ID4gPiA+ID4gPiAgICAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gPiA+
ID4gPiA+ID4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gPiA+ID4gPiA+ID4g
PiBpbmRleCBjNGY2MWQ4MmZiNzI3Li43OTBkOTEwZGFmYTVkIDEwMDY0NAo+ID4gPiA+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gPiA+ID4gPiA+ID4g
KysrIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gPiA+ID4gPiA+ID4gQEAg
LTY0OCw4ICs2NDgsNiBAQCBtZXNvbl9zZXJpYWxfZWFybHlfY29uc29sZV9zZXR1cChzdHJ1Y3QK
PiA+ID4gPiA+ID4gPiA+IGVhcmx5Y29uX2RldmljZSAqZGV2aWNlLCBjb25zdCBjaGFyICpvcHQK
PiA+ID4gPiA+ID4gPiA+ICAgIE9GX0VBUkxZQ09OX0RFQ0xBUkUobWVzb24sICJhbWxvZ2ljLG1l
c29uLWFvLXVhcnQiLAo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgbWVzb25fc2VyaWFs
X2Vhcmx5X2NvbnNvbGVfc2V0dXApOwo+ID4gPiA+ID4gPiA+ID4gLU9GX0VBUkxZQ09OX0RFQ0xB
UkUobWVzb24sICJhbWxvZ2ljLHQ3LXVhcnQiLAo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
IG1lc29uX3NlcmlhbF9lYXJseV9jb25zb2xlX3NldHVwKTsKPiA+ID4gPiA+ID4gPiA+ICAgICNk
ZWZpbmUgTUVTT05fU0VSSUFMX0NPTlNPTEVfUFRSKF9kZXZuYW1lKQo+ID4gPiA+ID4gPiA+ID4g
KCZtZXNvbl9zZXJpYWxfY29uc29sZV8jI19kZXZuYW1lKQo+ID4gPiA+ID4gPiA+ID4gICAgI2Vs
c2UKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEhvdyBkbyB5b3UgdXNlIGVhcmx5Y29uIHdp
dGggdGhpcyByZW1vdmVkID8KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE5laWwKPiA+ID4g
PiA+ID4gVGhpcyBpcyBteSBrZXJuZWwgY21kbGluZToKPiA+ID4gPiA+ID4gY29uc29sZT10dHlT
MCw5MjE2MDAgbm9fY29uc29sZV9zdXNwZW5kIGVhcmx5Y29uPXR0eVMwLDB4ZmUwNzgwMDAKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gQW5kIEkgY2FuIHNlZSBteSBsb2c6Cj4gPiA+ID4gPiA+IGJv
b3QgNjRiaXQga2VybmVsCj4gPiA+ID4gPiA+IFsgICAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXgg
b24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDA5Ml0KPiA+ID4gPiA+ID4gWyAg
ICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjUuMC1yYzctbmV4dC0yMDIzMDgyNSsKPiA+ID4g
PiA+ID4gKHRhbnVyZWFsQHJ5emVuKSAoYWFyY2g2NC1ub25lLWxpbnV4LWdudS1nY2MgKEdOVSBU
b29sY2hhaW4gZm9yIHRoZQo+ID4gPiA+ID4gPiBBLXByb2ZpbGUgQXJjaGl0ZWN0dXJlIDEwLjMt
MjAyMS4wNyAoYXJtLTEwLjI5KSkgMTAuMy4xIDIwMjEwNjIxLAo+ID4gPiA+ID4gPiBHTlUgbGQg
KEdOVSBUb29sY2hhaW4gZm8zCj4gPiA+ID4gPiA+IFsgICAgMC4wMDAwMDBdIEtBU0xSIGRpc2Fi
bGVkIGR1ZSB0byBsYWNrIG9mIHNlZWQKPiA+ID4gPiA+ID4gWyAgICAwLjAwMDAwMF0gTWFjaGlu
ZSBtb2RlbDogS2hhZGFzIHZpbTQKPiA+ID4gPiA+ID4gWyAgICAwLjAwMDAwMF0gT0Y6IHJlc2Vy
dmVkIG1lbToKPiA+ID4gPiA+ID4gMHgwMDAwMDAwMDA1MDAwMDAwLi4weDAwMDAwMDAwMDUyZmZm
ZmYgKDMwNzIgS2lCKSBub21hcCBub24tcmV1c2FibGUKPiA+ID4gPiA+ID4gc2VjbW9uQDUwMDAw
MDAKPiA+ID4gPiA+ID4gWyAgICAwLjAwMDAwMF0gT0Y6IHJlc2VydmVkIG1lbToKPiA+ID4gPiA+
ID4gMHgwMDAwMDAwMDA1MzAwMDAwLi4weDAwMDAwMDAwMDcyZmZmZmYgKDMyNzY4IEtpQikgbm9t
YXAKPiA+ID4gPiA+ID4gbm9uLXJldXNhYmxlIHNlY21vbkA1MzAwMDAwCj4gPiA+ID4gPiA+IC4u
Lgo+ID4gPiA+ID4gPiBbICAgIDAuMDc5MzY4XSBpbyBzY2hlZHVsZXIgbXEtZGVhZGxpbmUgcmVn
aXN0ZXJlZAo+ID4gPiA+ID4gPiBbICAgIDAuMDc5Mzc0XSBpbyBzY2hlZHVsZXIga3liZXIgcmVn
aXN0ZXJlZAo+ID4gPiA+ID4gPiBbICAgIDAuMDc5NTQ5XSBpbyBzY2hlZHVsZXIgYmZxIHJlZ2lz
dGVyZWQKPiA+ID4gPiA+ID4gWyAgICAwLjA4MzM3M10gZmUwNzgwMDAuc2VyaWFsOiB0dHlTMCBh
dCBNTUlPIDB4ZmUwNzgwMDAgKGlycSA9IDE0LAo+ID4gPiA+ID4gPiBiYXNlX2JhdWQgPSAxNTAw
MDAwKSBpcyBhIG1lc29uX3VhcnQKPiA+ID4gPiA+ID4gWyAgICAwLjA4MzQwM10gcHJpbnRrOiBj
b25zb2xlIFt0dHlTMF0gZW5hYmxlZAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBcyB0aGUgbG9n
IGlzIE9LLCBhbmQgVDcgZm9yIG5vdyBpcyBiaW5kaW5nIGFnYWluc3QgUzQgY29kZSB3ZQo+ID4g
PiA+ID4gPiBzaG91bGQgZHJvcCB0aGlzIHBhdGNoIGFuZCBhZGQgYSBTNCBvbmUgaWYgbmVlZGVk
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBCdXQganVzdCBoYXZpbmcgdGhpcyBsb2cgaXMgbm90
IGVub3VnaCBmb3IgdGVzdGluZyBlYXJseWNvbj8KPiA+ID4gPiA+ID4gSSBhbSBhc3N1bWluZyB0
aGF0IGJ5IGp1c3QgaGF2aW5nIHRoZSBsb2cgc2luY2UgMC4wMDAwIGlzIGEgZ29vZAo+ID4gPiA+
ID4gPiBzaWduIHRoYXQgZWFybHljb24gaXMgd29ya2luZy4KPiA+ID4gPiA+ID4gQ291bGQgeW91
IGdpdmUgZnVydGhlciBndWlkYW5jZT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGaXJzdCB0aGUga2Vy
bmVsIGFyZ3VtZW50IGlzIHNpbXBseSAiZWFybHljb24iIHdpdGggbm8gb3RoZXIgb3B0aW9ucywK
PiA+ID4gPiA+IHRoZSBlYXJseWNvbiBjb2RlIHdpbGwgZmV0Y2ggdGhlIGZpcnN0IHVhcnQgdXNp
bmcgdGhlIERUCj4gPiA+ID4gPiAvY2hvc2VuL3N0ZG91dC1wYXRoIHByb3BlcnR5Lgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFRoZW4geW91IHNob3VsZCBzZWUgc29tZXRoaW5nIGxpa2UgcmlnaHQgYWZ0
ZXIgIk1hY2hpbmUgbW9kZWwiOgo+ID4gPiA+ID4gWyAgICAwLjAwMDAwMF0gZWFybHljb246IG1l
c29uMCBhdCBNTUlPIDB4MDAwMDAwMDBmZjgwMzAwMCAob3B0aW9ucwo+ID4gPiA+ID4gJzExNTIw
MG44JykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgYm9vdCBsb2cgeW91IHNoYXJlIGRvZXNuJ3Qg
dXNlIGVhcmx5Y29uLCBpdCB3YWl0cyB1bnRpbCBhbGwKPiA+ID4gPiA+IGRlcGVkZW5jeSBvZiB0
aGUgVUFSVAo+ID4gPiA+ID4gaGFzIGJlZW4gcHJvYmVkIGJlZm9yZSBwcm9iaW5nIHRoZSBVQVJU
IGRyaXZlciBhbmQgcHJpbnRzIHRoZSB3aG9sZSBib290Cj4gPiA+ID4gPiBsb2cuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gRWFybHljb24gaXMgYSBtZWNoYW5pc20gdG8gdXNlIHRoZSBVQVJUIEhXIGFz
IGNvbmZpZ3VyZWQgYnkgdGhlCj4gPiA+ID4gPiBib290bG9hZGVyIGluCj4gPiA+ID4gPiBhIG1p
bmltYWwgd2F5IHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgaW4gb3JkZXIgdG8gZGV0ZWN0IHZlcnkg
ZWFybHkgbG9ja3Vwcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBLZWVwaW5nIE9GX0VBUkxZQ09OX0RF
Q0xBUkUgZm9yIHQ3IHdvdWxkIGVuYWJsZSB0aGlzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5laWwK
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEx1Y2FzIFRhbnVyZQo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4KPiA+ID4gPiBCdXQgdGhlbiB3ZSB3b3VsZCBuZWVkIHRvIGFkZCBFYXJseWNv
biBmb3IgUzQgdG9vLgo+ID4gPiA+IEhvdyBjYW4gd2UgYWRkIG9uZSBFYXJseWNvbiBmb3IgYWxs
IGZ1dHVyZSBTb0NzLCBsaWtlIFM0IGFuZCBUNz8KPiA+ID4gPgo+ID4gPgo+ID4gPiBQZXIgbXkg
dW5kZXJzdGFuZGluZywgeW91IGp1c3QgbmVlZCB0byBkZWNsYXJlIFVBUlQgZHRzIG5vZGUgd2l0
aCB0aGUKPiA+ID4gZm9sbG93aW5nIGNvbXBhdGlibGUgc3RyaW5nOiAiYW1sb2dpYyxtZXNvbi1h
by11YXJ0Ii4gSXQgd2lsbCBlbmFibGVkCj4gPiA+IGVhcmx5Y29uLiBUaGVyZSBpcyBubyBuZWNj
ZXNzYXJ5IHRvIGRlY2xhcmUgc2VwYXJhdGUKPiA+ID4gT0ZfRUFSTFlDT05fREVDTEFSRSgpLiBJ
dCdzIHdvcmtpbmcgb2theSBmb3IgQTEgZHRzOgo+ID4KPiA+IFRoaXMgd29ya3Mgb24gQTEgYmVj
YXVzZSB1YXJ0X0FPX0IgaXMgYW4gQWx3YXlzLU9uIFVBUlQsIGFuZCB1c2luZyBhbWxvZ2ljLG1l
c29uLWFvLXVhcnQKPiA+IGlzIGNvcnJlbnQuCj4gPiBCdXQgZm9yIFM0ICYgVDcsIEFtbG9naWMg
ZHJvcHBlZCB0aGUgQWx3YXlzLU9uIHBvd2VyIGRvbWFpbiwgc28gdGhlcmUncyBubyBtb3JlIEFP
IHVhcnRzLAo+ID4gc28gdXNpbmcgYW1sb2dpYyxtZXNvbi1hby11YXJ0IG9uIHRob3NlIGlzIGFi
dXNpbmcgdGhlIERUIHRvIGVuYWJsZSBhIGRyaXZlciBmdW5jdGlvbmFsaXR5Lgo+ID4KPiA+IFNv
IHRoZSBzb2x1dGlvbiBpcyB0byBhZGQgdGhvc2UgT0ZfRUFSTFlDT05fREVDTEFSRSBhbmQgb25s
eSB1c2UgdGhlIGNvcnJlY3QKPiA+IC9jaG9zZW4vc3Rkb3V0LXBhdGggcHJvcGVydHkuCj4KPiBP
aCwgSSBkaWRuJ3Qga25vdyBhYm91dCBtaXNzaW5nIEFsd2F5cy1PbiBVQVJUIEFPIHBvd2VyIGRv
bWFpbi4gSW4gdGhpcwo+IHNpdHVhdGlvbiBJJ20gZnVsbHkgYWdyZWUgd2l0aCBzZXBhcmF0ZSBP
Rl9FQVJMWUNPTl9ERUNMQVJFKCkuIFRoYW5rIHlvdQo+IGZvciBleHBsYW5hdGlvbiEKPgo+ID4g
Pgo+ID4gPiBtZXNvbi1hMS5kdHNpIHVhcnQgZGVjbGFyYXRpb246Cj4gPiA+ICAgICB1YXJ0X0FP
X0I6IHNlcmlhbEAyMDAwIHsKPiA+ID4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uLWExLXVhcnQiLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgImFtbG9naWMs
bWVzb24tYW8tdWFydCI7Cj4gPiA+ICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMDAwIDB4MCAw
eDE4PjsKPiA+ID4gICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI2IElSUV9UWVBF
X0VER0VfUklTSU5HPjsKPiA+ID4gICAgICAgICAgICAgY2xvY2tzID0gPCZ4dGFsPiwgPCZ4dGFs
PiwgPCZ4dGFsPjsKPiA+ID4gICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAieHRhbCIsICJwY2xr
IiwgImJhdWQiOwo+ID4gPiAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gPiAg
ICAgfTsKPiA+ID4KPiA+ID4gZWFybHljb24gZGVjbGFyYXRpb24gZnJvbSBkdHM6Cj4gPiA+ICAg
ICBhbGlhc2VzIHsKPiA+ID4gICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0X0FPX0I7Cj4gPiA+
ICAgICB9Owo+ID4gPgo+ID4gPiAgICAgY2hvc2VuIHsKPiA+ID4gICAgICAgICAgICAgc3Rkb3V0
LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7Cj4gPiA+ICAgICB9Owo+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
ID4gPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+ID4gPiA+IGxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+ID4gPgo+ID4KPgo+IC0tCj4gVGhhbmsgeW91LAo+
IERtaXRyeQpTbyBsZXQncyBhZGQ6CgpPRl9FQVJMWUNPTl9ERUNMQVJFKG1lc29uLCAiYW1sb2dp
YyxtZXNvbi1zNC11YXJ0IiwKbWVzb25fc2VyaWFsX2Vhcmx5X2NvbnNvbGVfc2V0dXApOwoKb2s/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
