Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28776C44508
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bW0+U0Kr6oCRZCZAk08GJfDVYZSxdqZkV+10sLnNrgo=; b=jwZuY20YlDzcg3
	GGa1eubXpTdjXctJrdKL14VgSwr2g7ED5D25VftP+gHaAdvXDkt3+Q1Sk7hW333Bu7pmre3N22t98
	dT99CrUEPuqDvux2VI2Cr/0TEWRXmJGs8MYPDSrx4I30y/iIAmnqEmK17wkhJn1z2R4TGF0lIuIyj
	UEG2I8AfvlfY5V63EMdvh391ivUbD848EhQ/344UD/SZlnXo+2sBxY+DiqdzIcLD6vGE/mTqHhGLl
	Tg5FZpR7aA5PBkDFzclnt1WRKrAVuw7sVvl6LqFVjvv8G4rQuSVubvFR+bF0yzeFFX52Snvi6Avep
	YlPmzOuASMO+Rh0xhPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Xl-0000000F6so-3bTw;
	Wed, 15 Jul 2026 14:25:01 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Xj-0000000F6rO-05Az
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 14:25:01 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-39c74722e27so22590831fa.0
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Jul 2026 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784125496; x=1784730296; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=aDu47q+zXVkK1WxLa93ICnTwzmGc2r/QUomsyT0oOoZlmeNfci0u5ZCQNIva5F9E5v
         9wlGgz4HRjbkk5mocrUbyaMhYPZFT6PQMbiGlHz3SHKBTiJntH/nVyx9658YjbiwrfUA
         OBnQ3nrXlPYwGrnCKOFwW/PyfyMFfK/2tZO7SbsBd0MswJgeBU7z8eJPUw7VFnzn/cRC
         eh+bpOODTQGXrqDXMWUABtXTkodV8cinP5oYhtlI6fnjEl9uy7bA2kb6IQIMjEOkwYV2
         ClDtn7EOzYv+ChHdjr5SPafc95srZG/+IxUb19lfdb1I9NJIWTzA83+bvPB/pYPbd+kL
         49aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125496; x=1784730296;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=qnQtptY9Cil7W4+V9VWuWS+fLppiKRAyTWpC7xOSKATbV0kE5FVh+fWxsVtq34J66W
         yCPYiOyiqKL0cfMP6qO3G0ddiJi46L8YYTRUenB5gIh+wwqH5STzAm363yzoJBHOQi3l
         HTkpl2X++O25HaTvSQY0GmwWgUNmvP7YBnHJcFlKEUjb+L3tsgPwqB7WJpOmnTYbn1z3
         dCffpHCNDTNrm5qiaYiw2h1qIK3IRthNqHsD72ACpqNgYr8Zz8uNA+lJv+s1d8W2RcfG
         iwzpI5TGDF0Ix23SyccsXMSjCnqE0JY0RGNsZLeM7VSw3pbTogo7H48PSSXlcQ/fzlYc
         DHlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1VYh2soHSIgidto3fqnKMvwOEaP8bZmoeynK0I/ZIwAomXEi8bAgQVtLGzmZS4Z2klqWP2zYL/Up0yVuA@lists.infradead.org
X-Gm-Message-State: AOJu0YwADRwZOK6kduYdTX92TVtiQaZLGMTZlEeuCJLCHG/hReQm0d4x
	oLaqi3AHa1kGfQzM+6i6KWUH2kH/8flt16Lw4ASlHijpUySw5OicbqGl
X-Gm-Gg: AfdE7cnb5EWN0377ffiiOCt7VRL19w2uLEEBC8Ex7p4mJmVMPm0FszMeAAoOSLaB5MQ
	UfIWns6x6nBLlDSTkv1BzM4pMNgUDJHD37foJ7nKcDXSRtzdSdOrbc0Px57qeC7EGK4CWF/Uaia
	lNxyzrMuuVWe1NPoYPb+AoxX7Bt6E0QdQ0s7RsaU4Rwi3rYw0ZdL07nmj+1vPgc4foRpw3/DckY
	PcPcQv6u8SHk5vLuZlEka5hpe1xd3gIkemNqVbnW8ea9R+Ra3XM8H1NeYlW6euPlPOOWHRqlMEV
	oAoAfgwccxcuEoVs1MFpmXirHrgYMu1iCwcJWpvVKvRk0BIXR/iq5xVNHBOKGQ1Ba/2XQpOUAEX
	62pfmsUD5Jsas8qYzH7+qvBMj6whZHjsBVnjsLN5MLHndqQRqdfvb1CXk/ueVHy5ddqkQZJ4uvf
	sKuUFYXmIBLEWvkrnp6yFpPrzdEgvihfwF/cgmmIEX+/FZSAD8zB0k
X-Received: by 2002:a05:651c:b28:b0:39a:fef1:ad7 with SMTP id 38308e7fff4ca-39c94cde536mr48470341fa.21.1784125496005;
        Wed, 15 Jul 2026 07:24:56 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180f3sm36977811fa.4.2026.07.15.07.24.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2026 07:24:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Date: Wed, 15 Jul 2026 18:24:39 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Doruk Tan Ozturk <doruk@0sec.ai>
Message-Id: <8DCA30D7-46DA-41A3-BB05-4C841D20BC0F@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_072459_084548_41058767 
X-CRM114-Status: GOOD (  21.88  )
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

PiBPbiAxNCBKdWwgMjAyNiwgYXQgMTE6MjPigK9hbSwgQW5hbmQgTW9vbiA8bGludXguYW1vb25A
Z21haWwuY29tPiB3cm90ZToKPiAKPiBIaSBBbGwsCj4gCj4gT24gTW9uLCAxMyBKdWwgMjAyNiBh
dCAxNzozOCwgQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPiB3cm90ZToKPj4gCj4+
IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHJlc3NlcyBhIGNvbGxlY3Rpb24gb2YgY3JpdGljYWwgcmFj
ZSBjb25kaXRpb25zLAo+PiBtZW1vcnkgbGVha3MsIHVzZS1hZnRlci1mcmVlIGJ1Z3MsIGFuZCBy
ZXNvdXJjZSBtYW5hZ2VtZW50IGlzc3Vlcwo+PiB3aXRoaW4gdGhlIEFtbG9naWMgTWVzb24gdmlk
ZW8gZGVjb2RlciAobWVzb24tdmRlYykgZHJpdmVyIGFuZAo+PiBhc3NvY2lhdGVkIGNvbXBvbmVu
dHMuCj4+IAo+PiBUaGUgcHJpbWFyeSBmb2N1cyBpcyB0aWdodGVuaW5nIHNlc3Npb24gbGlmZWN5
Y2xlcywgc2FmZWx5IHN5bmNocm9uaXNpbmcKPj4gdGhlIFY0TDIgbTJtIGZyYW1ld29yayBjYWxs
YmFja3MsIGhhcmRlbmluZyB3b3JrIHF1ZXVlIG9wZXJhdGlvbnMKPj4gKGVzcGFyc2VyX3F1ZXVl
X3dvcmspLCBhbmQgY29ycmVjdGluZyBidWZmZXIgdmFsaWRhdGlvbnMgdG8gcHJldmVudAo+PiBz
dGFiaWxpdHkgaXNzdWVzIGxpa2UgS0FTQU4gb3V0LW9mLWJvdW5kcyBlcnJvcnMgb3Igc3RyZWFt
LW9uIHRpbWVvdXRzLgo+PiAKPj4gU3VtbWFyeSBvZiBDaGFuZ2VzOgo+PiAqIFJhY2UgQ29uZGl0
aW9ucyAmIFN5bmNocm9uaXNhdGlvbjogRml4ZXMgbXVsdGktdGhyZWFkaW5nIGFuZAo+PiAgZXhl
Y3V0aW9uIHJhY2VzIGFjcm9zcyBzdHJlYW0tb24sIHN0cmVhbS1vZmYsIGpvYiBhYm9ydCwgYW5k
Cj4+ICB0ZWFyZG93biBwYXRod2F5cy4KPj4gKiBNZW1vcnkgTGlmZWN5Y2xlOiBFbGltaW5hdGVz
IG1lbW9yeSBsZWFrcyBhbmQgdXNlLWFmdGVyLWZyZWUKPj4gIHZ1bG5lcmFiaWxpdGllcyBieSBz
YWZlbHkgcGlubmluZywgY2FuY2VsaW5nLCBhbmQgc2VxdWVuY2luZwo+PiAgZGV2aWNlIHJlbW92
YWxzLgo+PiAqIFZQOSAmIEJ1ZmZlciBIYXJkZW5pbmc6IEFkZHJlc3NlcyBwYXlsb2FkIGhhbmRs
aW5nIGJ1Z3MgaW4gdGhlIEVTCj4+ICBwYXJzZXIsIHByb3Blcmx5IHRyYWNrcyBvbmdvaW5nIGJ1
ZmZlcnMgdmlhIGF0b21pYyBjb3VudGVycywgYW5kCj4+ICBwcmV2ZW50cyBpbnZhbGlkIG1lbW9y
eSB3cml0ZXMuCj4+ICogUGxhdGZvcm0vRE1BIEFkanVzdG1lbnRzOiBBZGp1c3RzIERNQSBzZWdt
ZW50IGNvbmZpZ3VyYXRpb25zLAo+PiAgY2FudmFzIGhhbmRsaW5nLCBhbmQgYnVmZmVyIHNpemVz
IHRvIG1hdGNoIG1vZGVybiBoYXJkd2FyZSBkZW1hbmRzLgo+PiAKPj4gTm90ZSBvbiBhbiBvdXRz
dGFuZGluZyBpc3N1ZToKPj4gQW4gZXhlY3V0aW9uIGRlYWRsb2NrIG9jY3VycyBpbiB0aGUgZHJp
dmVyIHdvcmtxdWV1ZSBwYXRoIGR1cmluZyBoaWdoCj4+IHN0cmVzcyBvciBsb25nIHBsYXliYWNr
IHNlc3Npb25zLiBUaGlzIHN0YWxsIGlzIHRyaWdnZXJlZCB3aGVuIHRoZQo+PiBBbWxvZ2ljIGhh
cmR3YXJlIGludGVybmFsIHZpZGVvIEZJRk8gYnVmZmVyIGJlY29tZXMgY29tcGxldGVseSBmdWxs
Lgo+PiBXaGVuIGVzcGFyc2VyX3F1ZXVlX2FsbF9zcmMgcnVucywgdGhlIGNhcGFjaXR5IHZhbGlk
YXRpb24gY2hlY2sgaXMKPj4gdHJpcHBlZCBkdWUgdG8gYSBkZXNpZ24gbGltaXRhdGlvbiBpbiBo
b3cgYnVmZmVyIGV4aGF1c3Rpb24gaXMgaGFuZGxlZC4KPj4gVGhpcyBibG9ja3MgcHJvZ3Jlc3Mg
YW5kIGxlYXZlcyB0aGUgd29ya3F1ZXVlIHdvcmtlciB3YWl0aW5nIGluZGVmaW5pdGVseQo+PiBv
biBhIGNvcmUgbXV0ZXggbG9jay4KPj4gCj4+IFRoZSByZXN1bHRpbmcgaHVuZyB0YXNrIGNhbGwg
dHJhY2Ugc2hvd3MgdGhlIHdvcmtlciB0aHJlYWQgYmxvY2tpbmcKPj4gb24gdGhlIGludGVybmFs
IGxvY2s6Cj4+IAo+PiBXb3JrcXVldWU6IGV2ZW50cyBlc3BhcnNlcl9xdWV1ZV9hbGxfc3JjIFtt
ZXNvbl92ZGVjXQo+PiAuLi4KPj4gX19tdXRleF9sb2NrCj4+IG11dGV4X2xvY2tfbmVzdGVkCj4+
IGVzcGFyc2VyX3F1ZXVlX2FsbF9zcmMKPj4gCj4+IEkgaGF2ZSB0cmllZCB0byBhZGRyZXNzIHRo
aXMgaXNzdWUsIGJ1dCB0aGUgdW5kZXJseWluZyBkZWFkbG9jayBwZXJzaXN0cwo+PiB1bmRlciBl
eHRyZW1lIGNvbmRpdGlvbnMuCj4+IAo+PiBBbnkgZmVlZGJhY2sgb24gdGhpcyBuZXcgYXBwb2Nr
IGlzIHdlbGNvbWUuCj4+IAo+PiBUZXN0aW5nIHdhcyBkb25lIHVzaW5nIHY0bDItY29tcGxpYW5j
ZSBhbmQgYWN0aXZlIGRlY29kaW5nIHBpcGVsaW5lcwo+PiBvbiBNZXNvbiBwbGF0Zm9ybXMgKGxp
a2UgSGFyZGtlcm5lbCBPRFJPSUQtTjIrIGFuZCBPRFJPSUQtQzQpIFNCQ3MuCj4+IAo+PiBUaGUg
djRsMi1jb21wbGlhbmNlIHRlc3RzIHBhc3NlZCBzdWNjZXNzZnVsbHkgdmlhOgo+PiAkIHY0bDIt
Y29tcGxpYW5jZSAtcyAtdiAtZCAvZGV2L3ZpZGVvMAo+PiAKPj4gUGlwZWxpbmVzIHdlcmUgdmFs
aWRhdGVkIHVzaW5nIHRoZSBmb2xsb3dpbmcgR1N0cmVhbWVyIHNjcmlwdC4KPj4gCj4+IFsxXSBo
dHRwczovL2dpc3QuZ2l0aHViLmNvbS9tb29ubGludXgvMDgyOTViYTFmMTdjZTcxNTU1NTA3NzNm
MmQyY2I2ZTUKPj4gCj4+IFByZXZpb3VzIGNoYW5nZXM6Cj4+IHY2OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjA1MzAwOTQzMjYuMTE4OTItMi1saW51eC5hbW9vbkBnbWFpbC5jb20v
Cj4+IAo+IAo+IEkgd2lsbCByZXZpZXcgU2FzaGlrbydzIGZlZWRiYWNrLiBJIHdpbGwgbG9vayBp
bnRvIHRoZXNlIHN1Z2dlc3Rpb25zIGFuZAo+IHdvcmsgb24gaW5jb3Jwb3JhdGluZyB0aGVtIHRv
IGltcHJvdmUgdGhlIGNvZGUgcXVhbGl0eQoKSGVsbG8gQW5hbmQsCgpJ4oCZdmUgcGlja2VkIHRo
aXMgZW50aXJlIHNlcmllcyBpbnRvIGEgTGlicmVFTEVDIGltYWdlIHVzaW5nIEtvZGkgMjIgYW5k
CmZmbXBlZyA4LjEgKHVzaW5nIHRoZSBSUGkgc291cmNlIHRoYXQgaW1wcm92ZXMgdjRsMl9tMm0g
YmVoYXZpb3VyKSBvbiBhCjcuMi1yYzMga2VybmVsIGFuZCBydW4gc29tZSB0ZXN0cyBvbiBhIEdY
QkIvUzkwNSBib2FyZC4KCldpdGhvdXQgdGhpcyBzZXJpZXMgSDI2NCBwbGF5cyBhbmQgc2Vla3Mg
d2VsbCBhbmQgdGhlIHVubWVyZ2VkIEgyNjUgY29kZWMKYWxzbyBwbGF5cyB3ZWxsIGFuZCBzZWVr
cyB3ZWxsIGJ1dCB3aXRoIG1pbm9yIGFydGVmYWN0cyAoc29tZXRoaW5nIHRoYXQgSQpuZWVkIHRv
IGxvb2sgaW50bykuIFRoZSBleHBlcmllbmNlIGlzIG5vdCBwZXJmZWN0ICh0aGlzIGRyaXZlciBo
YXMgYSBmZXcKZmxhd3MpIGJ1dCBpdOKAmXMgY29uc2lzdGVudCB3aXRoIHRoZSDigJh1c2FibGXi
gJkgYmVoYXZpb3VyIG9mIHRoZSBkcml2ZXIgaW4KdGhlIGxhc3QgMS0yIHllYXJzLgoKV2l0aCB0
aGlzIHNlcmllcyBIMjY0IHBsYXlzIGJ1dCBzZWVrIHNlZW1zIHRvIGhhbmcgZXZlcnl0aGluZyB3
aXRoIG5vIGxvZ2dlZAplcnJvcnMgYW55d2hlcmUuIEgyNjUgcmVzdWx0cyBpbiBhIGJsYWNrIHNj
cmVlbiBhbmQgYWdhaW4gZXZlcnl0aGluZ+KAmXMgaHVuZy4KCkl04oCZcyBwb3NzaWJsZSB0aGF0
IGtlcm5lbCBjaGFuZ2VzIG5lZWQgdG8gYmUgYmFsYW5jZWQgd2l0aCB1c2Vyc3BhY2U/IENhbgp5
b3UgcGxlYXNlIHNoYXJlIGRldGFpbHMgb2YgaG93IHlvdSBoYXZlIGJlZW4gdGVzdGluZyB0aGlu
Z3MgKGFuZCBvbiB3aGF0CmhhcmR3YXJlKT8gLSBJIHdpbGwgYXR0ZW1wdCB0byByZXBsaWNhdGUg
YW5kIHBva2Ugc21hbGxlciBwb3J0aW9ucyBvZiB0aGUKc2VyaWVzIHRvIHNlZSBpZiBJIGNhbiBp
c29sYXRlIHdoaWNoIGJpdHMgYXJlIHByb2JsZW1hdGljIHRvIHRoZSBvdGhlcndpc2UKdXNhYmxl
IGN1cnJlbnQgZXhwZXJpZW5jZS4KCkNocmlzdGlhbgoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
